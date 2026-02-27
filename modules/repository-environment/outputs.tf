// It's important to get the owner and the name from the exported values to strengthen the dependency graph
output "repo_owner" {
  value = split("/", data.github_repository.repository.full_name)[0]
}

output "repo_name" {
  value = split("/", data.github_repository.repository.full_name)[1]
}

output "repo_full_name" {
  value = data.github_repository.repository.full_name
}