output "repo_owner" {
  value = var.repo_owner
}

output "repository_id" {
  value = data.github_repository.repository
}