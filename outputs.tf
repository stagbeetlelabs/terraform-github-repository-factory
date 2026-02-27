output "repo_owner" {
  value = split("/", local.repository.full_name)[0]
}

output "repo_name" {
  value = split("/", local.repository.full_name)[1]
}
