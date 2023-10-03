# Generate a random uuid string that is intended to be used as unique identifier for resources
resource "random_uuid" "test" {
}

# Create new storage bucket in the US multi-region
# with standard storage
resource "google_storage_bucket" "static" {
  name          = "test_bucket${random_uuid.test.result}"
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}

# Upload a text file as an object
# to the storage bucket
resource "google_storage_bucket_object" "default" {
  name         = "sample_file.txt"
  source       = "/root/terraform/sample_file.txt"
  content_type = "text/plain"
  bucket       = google_storage_bucket.static.id
}
