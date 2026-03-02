/*
 * GITHUB REPOSITORY
 */
locals {
  template_repo_owner = split("/", var.template_repo)[0]
  template_repo_name  = split("/", var.template_repo)[1]
}

resource "github_repository" "repository" {
  count     = var.create_repository ? 1 : 0
  name        = var.repo_name
  description = var.repo_description

  visibility  = "private"
  is_template = true

  dynamic "template" {
    for_each = var.template_repo != null && var.template_repo != "" ? [1] : []
    content {
      owner                = local.template_repo_owner
      repository           = local.template_repo_name
      include_all_branches = false
    }
  }

  lifecycle {
    prevent_destroy = var.prevent_destroy
  }

  // Archive the repository when it is destroyed. A useful failsafe to prevent accidental deletion of repositories.
  archive_on_destroy = var.archive_on_destroy

  // Automatically delete branch on merge. This is a very important setting to simplify the AI agent's job.
  delete_branch_on_merge = true
}

data "github_repository" "repository" {
  count     = var.create_repository ? 0 : 1
  full_name = "${var.repo_owner}/${var.repo_name}"
}

locals {
  repository = var.create_repository ? github_repository.repository[0] : data.github_repository.repository[0]
}

// Set branch protection rules
resource "github_branch_protection" "branch_protection" {
  repository_id = local.repository.id
  pattern     = "main"
}

/*
 * GITHUB SECRETS
 */
resource "github_actions_secret" "secrets" {
  for_each        = var.secrets
  repository      = local.repository.name
  secret_name     = each.key
  plaintext_value = each.value
}

/*
 * GITHUB VARIABLES
 */
resource "github_actions_variable" "variables" {
  for_each      = var.variables
  repository    = local.repository.name
  variable_name = each.key
  value         = each.value
}
