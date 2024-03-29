provider "google" {
  credentials = var.gcp_creds
  project     = "hashi-lab"
  region      = "us-central1"
}

resource "google_compute_instance" "instance" {
  name         = "jmartinson-delete-me"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  labels = {
    env   = "default"
    owner = "jmartinson-at-hashicorp-com"
    ttl   = "77400"
    name  = "jmartinson-delete-me"
    newtag = "asdf"
  }


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}

# queue from commit
