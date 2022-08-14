resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "BigQuery1"
  friendly_name               = var.dataset_name[0]
  location                    = "EU"

  access {
    role          = "roles/bigquery.user"
    user_by_email = google_service_account.bqowner.email
  }

}

resource "google_bigquery_dataset" "dataset02" {
  dataset_id                  = "BigQuery2"
  friendly_name               = var.dataset_name[1]
  location                    = "EU"

  access {
    role          = "roles/bigquery.user"
    user_by_email = google_service_account.bqowner.email
  }

}

resource "google_bigquery_dataset" "dataset03" {
  dataset_id                  = "BigQuery3"
  friendly_name               = var.dataset_name[2]
  location                    = "EU"

  access {
    role          = "roles/bigquery.user"
    user_by_email = google_service_account.bqowner.email
  }

}

resource "google_service_account" "bqowner" {
  account_id = "bqowner"
}
