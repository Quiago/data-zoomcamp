for month in {1..6}; do
    month_formatted=$(printf "%02d" "$month")
    file="yellow_tripdata_2024-${month_formatted}.parquet"
    echo "Subiendo $file..."
    gsutil cp "$file" gs://vivid-layout-448602-n1-terra-bucket
done