
variable "project" {
  type        = string
  description = "The project ID"

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "The project ID must not be empty."
  }
}
