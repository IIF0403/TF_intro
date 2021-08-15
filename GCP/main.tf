terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.cred_file)

  project = "poetic-maxim-323015"
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_1" {
  name = "network1"
}


resource "google_compute_subnetwork" "subnet_1" {
  name          = "subnetwork-test"
  ip_cidr_range = "10.2.0.0/16"
  network       = google_compute_network.vpc_1.id

}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  tags = ["web", "dev"]

  boot_disk {
    initialize_params {
      #image = "debian-cloud/debian-9"
      image = "cos-cloud/cos-stable"
    }
  }

  network_interface {
    network = google_compute_network.vpc_1.name
    access_config {
    }
  }
}

