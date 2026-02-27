// It's important to get the owner and the name from the exported values to strengthen the dependency graph
output "repo_owner" {
  value = split("/", github_repository_environment.environment.repository)[0]
}

output "repo_name" {
  value = split("/", github_repository_environment.environment.repository)[1]
}

output "repo_full_name" {
  value = github_repository_environment.environment.repository
}