output "repo_owner" {
  value = var.repo_owner
}

output "repo_name" {
  value = var.repo_name
}

output "repo_full_name" {
  value = data.github_repository.repository.full_name
}