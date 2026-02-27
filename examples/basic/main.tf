module "github_repository" {
  source = "../../"

  repo_owner = "GITHUB_ORG"
  repo_name  = "REPO_NAME"
  template_repo = "GITHUB_ORG/REPO_NAME"
  repo_description = "Description of new repository"
  create_repository = true
  variables = {}
  secrets =   {}
}

module "github_repository_environment" {
  source = "../../modules/repository_environment"

  repo_owner = module.github_repository.name
  repo_name  = module.github_repository.name
  env_code   = var.env_code
  environment_variables = var.environment_variables
  environment_secrets = var.environment_secrets
}
