
variable "repo_owner" {
  description = "The repository owner or organisation"
  type        = string
}

variable "repo_name" {
  description = "The repository name"
  type        = string
}

variable "template_repo_owner" {
  description = "The template repository owner or organisation"
  type        = string
  default     = null
}

variable "template_repo_name" {
  description = "The template repository name"
  type        = string
  default     = null
}

variable "repo_description" {
  description = "A description of what the repository contains"
  type        = string
}

variable "create_repository" {
  description = "Create the repository"
  type        = bool
  default     = false
}

variable "environments" {
  description = "Landing Zone environments"
  type        = map(any)
}

variable "variables" {
  description = "Repository variables"
  type        = map(string)
  default     = {}
}

variable "secrets" {
  description = "Repository secrets"
  type        = map(string)
  default     = {}
}
