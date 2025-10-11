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


resource "google_compute_instance" "terra-lab4-vm" {
    name         = "terra-lab4-vm"
    machine_type = "e2-micro"
    zone         = "asia-south1-a"

    boot_disk {
        initialize_params {
            image = "projects/ubuntu-os-cloud/global/images/ubuntu-minimal-2510-questing-amd64-v20251007"
        }
    }

    network_interface {
        network = "default"
        access_config {
        }
    }

    tags = ["terra-lab4", "terraform"]

    labels = {
        name    = "terra-lab4-vm"
        project = "terraform"
    }
}

output "vm_name" {
    value = google_compute_instance.terra-lab4-vm.name
}

output "vm_external_ip" {
    value = google_compute_instance.terra-lab4-vm.network_interface.0.access_config.0.nat_ip
}
