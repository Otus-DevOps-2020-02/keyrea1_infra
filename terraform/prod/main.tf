provider "google" {
  version = "~> 2.15"
  project = var.project
  region  = var.region
}

module "app" {
  source            = "../modules/app"
  public_key_path   = var.public_key_path
  zone              = var.zone
  app_disk_image    = var.app_disk_image
  private_key_path  = var.private_key_path
  DATABASE_URL      = module.db.DATABASE_URL
  provision_enabled = false

}

module "db" {
  source            = "../modules/db"
  public_key_path   = var.public_key_path
  zone              = var.zone
  db_disk_image     = var.db_disk_image
  private_key_path  = var.private_key_path
  provision_enabled = false
}

module "vpc" {
  source        = "../modules/vpc"
  source_ranges = ["195.91.236.129/32"]
}
