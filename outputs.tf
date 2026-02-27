output "repo_owner" {
  value = split("/", github_branch_protection.branch_protection.repository_id)[0]
}

output "repo_name" {
  value = split("/", github_branch_protection.branch_protection.repository_id)[1]
}
