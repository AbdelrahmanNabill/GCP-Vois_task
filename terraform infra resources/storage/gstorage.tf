resource "google_storage_bucket" "Bucket01" {
  name          = var.bucket_name[0]
  location      = var.bucket_location
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

}

resource "google_storage_bucket" "Bucket02" {
  name          = var.bucket_name[1]
  location      = var.bucket_location
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

}

resource "google_storage_bucket" "Bucket03" {
  name          = var.bucket_name[2]
  location      = var.bucket_location
  force_destroy = true
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

}