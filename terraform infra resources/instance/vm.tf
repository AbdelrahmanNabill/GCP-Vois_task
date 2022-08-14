resource "google_compute_instance" "test-vm" {
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = var.machine_zone


  boot_disk {
    initialize_params {
      image = var.machine_image
      size = "100"
    }
  }

  network_interface {
    network = var.vpc_id
    subnetwork = var.subnet_id

    # access_config {
    #   // Ephemeral public IP
    # }
  }


  service_account {
    email  = var.SA
    scopes = ["cloud-platform"]
  }
}