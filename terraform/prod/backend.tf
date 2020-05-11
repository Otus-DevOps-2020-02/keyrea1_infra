terraform {
  backend "gcs" {
    bucket  = "keyrea1-terraform"
    prefix  = "prod"
  }
}
