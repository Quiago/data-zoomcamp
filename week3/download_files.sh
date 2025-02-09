 for month in {1..6}; do
    month_formatted=$(printf "%02d" "$month")
    url="https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2024-${month_formatted}.parquet"
    echo "Descargando archivo para el mes ${month_formatted}..."
    wget "$url"
done
