/*
 * GITHUB ENVIRONMENT
 */
resource "github_repository_environment" "environment" {
  environment = var.env_code
  repository  = "${var.repo_owner}/${var.repo_name}"

  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

/*
 * GITHUB ENVIRONMENT SECRETS
 */
resource "github_actions_environment_secret" "environment_secrets" {
  for_each        = var.environment_secrets
  repository      = github_repository_environment.environment.repository
  environment     = var.env_code
  secret_name     = each.key
  plaintext_value = each.value
}

/*
 * GITHUB ENVIRONMENT VARIABLES
 */
resource "github_actions_environment_variable" "environment_variables" {
  for_each      = var.environment_variables
  repository    = github_repository_environment.environment.repository
  environment   = var.env_code
  variable_name = each.key
  value         = each.value
}
