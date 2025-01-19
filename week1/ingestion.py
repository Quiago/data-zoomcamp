import pandas as pd
from sqlalchemy import create_engine
from time import time
import argparse
import gzip
import shutil
import os

def main(params):
    user = params.user
    password = params.password
    host = params.host
    port = params.port
    database = params.database
    url = params.url
    table_name = params.table_name
    print(f"Connecting to {host}:{port}/{database} as {user}")

    csv_name = 'output.csv'
    gzip_name = 'output.gz'
    if url.endswith('.csv'):
        os.system(f"wget {url} -O {csv_name}")
    if url.endswith('.gz'):
        os.system(f"wget {url} -O {gzip_name}")
        with gzip.open(gzip_name, 'rb') as f_in:
            with open(csv_name, 'wb') as f_out:
                shutil.copyfileobj(f_in, f_out)

    engine = create_engine(f'postgresql://{user}:{password}@{host}:{port}/{database}')
    engine.connect()
    print("Connection established!")

    df_iter = pd.read_csv(csv_name, iterator=True, chunksize=100000)
    df = next(df_iter)

    if 'tpep_pickup_datetime' in df.columns:
        df.tpep_pickup_datetime = pd.to_datetime(df.tpep_pickup_datetime)
        df.tpep_dropoff_datetime = pd.to_datetime(df.tpep_dropoff_datetime)

    df.head(n=0).to_sql(name=table_name, con=engine, if_exists='replace')
    df.to_sql(name=table_name, con=engine, if_exists='append')
    print("Table created!")

    while True:
        t_start = time()
        df = next(df_iter)
        if 'tpep_pickup_datetime' in df.columns:
            df.tpep_pickup_datetime = pd.to_datetime(df.tpep_pickup_datetime)
            df.tpep_dropoff_datetime = pd.to_datetime(df.tpep_dropoff_datetime)

        df.to_sql(name=table_name, con=engine, if_exists='append')
        t_end = time()

        print(f'Chunk loaded in {t_end - t_start} seconds')

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="IngestCSV data into the postgres database")

    parser.add_argument('--host', type=str, help='Host of the database', default='localhost')
    parser.add_argument('--port', type=int, help='Port of the database', default=5000)
    parser.add_argument('--user', type=str, help='User of the database', default='root')
    parser.add_argument('--password', type=str, help='Password of the database', default='root')
    parser.add_argument('--database', type=str, help='Database name', default='ny_taxi')
    parser.add_argument('--url', type=str, help='Url of the CSV file', required=True)
    parser.add_argument('--table-name', type=str, help='Table name to ingest the data', default='yellow_taxi')
    args = parser.parse_args()
    main(args)

