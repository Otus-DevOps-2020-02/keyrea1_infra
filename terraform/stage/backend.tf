terraform {
  backend "gcs" {
    bucket  = "storage-bucket-testing"
    prefix  = "stage"
  }
}
