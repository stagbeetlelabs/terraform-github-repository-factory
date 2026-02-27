# GCS Module Template

This repository contains a barebones Terraform module for provisioning a Google Cloud Storage (GCS) bucket, following standard project module structures.

## Usage

See the `examples/` directory for deployable examples.

### Example: Basic

```hcl
module "gcs" {
  source = "github.com/stagbeetlelabs/template-terraform-google-iac-module"

  project_id = "my-project-id"
  name       = "my-unique-bucket-name"
  location   = "EU"
}
```