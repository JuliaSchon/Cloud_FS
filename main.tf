terraform{
    required_providers {
        google ={
            source = "hashicorp/google"
            version = "~> 5.0"
        }
    }
}

provider "google" {
    project = "cloud-computing-451009"
    region = "us-west1" # cheapest location 
}

resource "google_storage_bucket" "mybucket" {
  name = "my-terraform-bucket-cloud-computing009988812"
  location = "us-west1"

    versioning{
    enabled = true
  }

  labels = {
    environment = "student-lab"
    managed_by = "terraform"
  }
}

resource "google_storage_bucket_iam_binding" "example_binding"{
  bucket = google_storage_bucket.mybucket.name
  role = "roles/storage.objectUser"

  members =["udaysidhu012@gmail.com"]
}

output "bucket_name"{
    value = google_storage_bucket.mybucket.name
}