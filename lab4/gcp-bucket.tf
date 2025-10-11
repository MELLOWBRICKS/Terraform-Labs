resource "google_storage_bucket" "terra-lab4-bucket" {
    name     = "terra-lab4-bucket-${random_id.bucket_suffix.hex}"
    location = "ASIA-SOUTH1"
    
    labels = {
        name        = "terra-lab4-bucket"
        project     = "terraform"
        environment = "lab"
    }
}

resource "random_id" "bucket_suffix" {
    byte_length = 8
}

output "bucket_name" {
    value = google_storage_bucket.terra-lab4-bucket.name
}

output "bucket_url" {
    value = google_storage_bucket.terra-lab4-bucket.url
}
