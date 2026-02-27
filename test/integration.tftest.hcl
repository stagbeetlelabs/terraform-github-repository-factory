# Instead of testing the root module, we test the example which exercises the root module
run "integration_test" {
  command = apply

  module {
    source = "./examples/basic"
  }

  # Tests run against this specific project defined by the caller, using the provider from example/basic/versions.tf
  # The WIF environment will be set up by the Github workflow beforehand.
  variables {
    project_id = var.project_id
    name       = "test-bucket-${run.setup.id}"
  }

  assert {
    condition     = module.gcs.name == "test-bucket-${run.setup.id}"
    error_message = "Bucket name output did not match expectation"
  }
}
