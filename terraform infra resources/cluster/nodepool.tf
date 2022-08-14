
# Node-pool
resource "google_container_node_pool" "nodepool" {
  name       = "nodepool"
  cluster    = google_container_cluster.gke.id
  node_count = var.node_number

  node_config {
    preemptible  = false
    machine_type = var.cluster_machine_type

    labels = {
      role = "nodepool"
    }

    service_account = var.SA
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

