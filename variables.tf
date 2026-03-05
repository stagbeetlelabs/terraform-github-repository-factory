
variable "repo_owner" {
  description = "The repository owner or organisation"
  type        = string
}

variable "repo_name" {
  description = "The repository name"
  type        = string
}

variable "template_repo" {
  description = "The template repository in the format 'owner/repository-name'"
  type        = string
  default     = null
  validation {
    condition     = can(regex("^[a-zA-Z0-9-]+/[a-zA-Z0-9-]+$", var.template_repo))
    error_message = "template_repo must be in the format 'owner/repository-name'"
  }
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

variable "archive_on_destroy" {
  description = "Archive the repository when it is destroyed"
  type        = bool
  default     = true
}
