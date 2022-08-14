# restricted Subnet
resource "google_compute_subnetwork" "restricted-subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr_block
  region        = var.region
  private_ip_google_access = true
  network       = google_compute_network.vpc-gcp.id
  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = "10.48.0.0/14"
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = "10.52.0.0/20"
  }
}

