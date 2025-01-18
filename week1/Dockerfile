FROM python:3.9

RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2-binary

WORKDIR /app
COPY ingestion.py ingestion.py

ENTRYPOINT [ "python", "ingestion.py" ]