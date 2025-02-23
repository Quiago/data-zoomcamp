import dlt


def load_data(start_month: str, end_month: str) -> None:
    """Constructs a pipeline that will load chess games of specific players for a range of months."""

    # configure the pipeline: provide the destination and dataset name to which the data should go
    pipeline = dlt.pipeline(
        pipeline_name="fhv_ny_taxi_pipeline",
        destination='filesystem',
        dataset_name="vivid-layout-448602-n1-terra-bucket",
    )
    # create the data source by providing a list of players and start/end month in YYYY/MM format
    for start_month_str in range(int(start_month), int(end_month)):
        print(f"Starting month: {start_month_str}")
        print("-"*50)
        if start_month_str < 10:
            start_month_str = f"0{start_month_str}"
        data = f"https://github.com/DataTalksClub/nyc-tlc-data/releases/download/fhv/fhv_tripdata_2019-{str(start_month_str)}.csv.gz"
        # load the "players_games" and "players_profiles" out of all the possible resources
        info = pipeline.run(data)
        print(info)
        print(f"Finish month: {start_month_str}")
        print("-"*50)



if __name__ == "__main__":
    # run our main example
    load_data("01", "13")
