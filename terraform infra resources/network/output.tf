output subnet-name {
  value       = google_compute_subnetwork.restricted-subnet.name
}

output ip_cidr_range {
  value       = google_compute_subnetwork.restricted-subnet.ip_cidr_range
}

output subnet-region {
  value       = google_compute_subnetwork.restricted-subnet.region
}

output vpc_name {
  value       = google_compute_network.vpc-gcp.name
}

output vpc_id {
  value       = google_compute_network.vpc-gcp.id
}

output subnet_id {
  value       = google_compute_subnetwork.restricted-subnet.id
}

