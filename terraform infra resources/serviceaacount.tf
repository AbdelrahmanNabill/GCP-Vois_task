# service account for instance
resource "google_service_account" "kubernetes" {
  account_id = "kubernetes"
}

# role to access cluster and container
resource "google_project_iam_member" "Cluster"{
    project = var.project
    role = "roles/container.admin"
    member = "serviceAccount:kubernetes@${var.project}.iam.gserviceaccount.com"
    depends_on = [google_service_account.kubernetes]
}

# role to access  container registory storage
resource "google_project_iam_member" "storage"{
    project = var.project
    role = "roles/storage.objectViewer"
    member = "serviceAccount:kubernetes@${var.project}.iam.gserviceaccount.com"
    depends_on = [google_service_account.kubernetes]
}

# service account for buckets
resource "google_service_account" "bucket" {
  account_id = "bucket"
}

# role to access bucket
resource "google_project_iam_member" "bucket"{
    project = var.project
    role = "roles/storage.objectViewer"
    member = "serviceAccount:bucket@${var.project}.iam.gserviceaccount.com"
     
    depends_on = [google_service_account.bucket]
}