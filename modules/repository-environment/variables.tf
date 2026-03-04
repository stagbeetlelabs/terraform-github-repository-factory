
variable "repo_owner" {
  description = "The repository owner or organisation"
  type        = string
}

variable "repo_name" {
  description = "The repository name"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables"
  type        = map(string)
}

variable "environment_secrets" {
  description = "Environment secrets"
  type        = map(string)
}
