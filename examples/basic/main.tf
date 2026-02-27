module "gcs" {
  source = "../.."

  project_id    = var.project_id
  name          = var.name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = true
}
