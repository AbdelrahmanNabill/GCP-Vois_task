resource "google_container_cluster" "gke" {
  name                     = var.cluster_name
  location                 = var.cluster_zone_list[0]
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.vpc_id
  subnetwork               = var.subnet_id

  # Optional, if you want multi-zonal cluster
  node_locations = [
    var.cluster_zone_list[1]
  ]


  release_channel {
    channel = "REGULAR"
  }


  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

}

