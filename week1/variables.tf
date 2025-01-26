variable "credentials" {
  description = "My google cloud credentials"
  default = "keys/my_creds.json"
}

variable "project" {
  description = "My Project Id"
  default     = "vivid-layout-448602-n1"
}

variable "region" {
  description = "My Project Region"
  default     = "europe-southwest1"
}

variable "location" {
  description = "My Project location"
  default     = "EUROPE-SOUTHWEST1"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "vivid-layout-448602-n1-terra-bucket"
}
variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}