run "unit_test" {
  command = plan

  variables {
    project_id = "test-project-id"
    name       = "test-bucket-name"
    location   = "EU"
  }

  assert {
    condition     = google_storage_bucket.bucket.name == "test-bucket-name"
    error_message = "Bucket name did not match expected"
  }
}
