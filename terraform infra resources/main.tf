module "network"{

source = "./network"
subnet_name = var.subnet_name
subnet_cidr_block = var.subnet_cidr_block
region   = var.region
vpc_name  = var.vpc_name
}

module "bigQuery"{
#  count         = 3
source = "./bigQuery"
dataset_name  = var.dataset_name
}

module "cluster"{
source = "./cluster"
  cluster_name = var.cluster_name
  vpc_id = module.network.vpc_id
  subnet_id = module.network.subnet_id
  cluster_zone_list = var.cluster_zone_list
  node_number = var.node_number
  cluster_machine_type = var.cluster_machine_type
  SA = google_service_account.kubernetes.email
  }

module "instance"{
source = "./instance"
  machine_name = var.machine_name
  vpc_id = module.network.vpc_id
  subnet_id = module.network.subnet_id
  machine_type = var.machine_type
  machine_zone = var.machine_zone
  machine_image = var.machine_image
  SA = google_service_account.kubernetes.email
  }

  module "storage"{
    # count         = 5
    source = "./storage"
    bucket_name = var.bucket_name
    bucket_location = var.bucket_location

  }