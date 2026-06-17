variable "tables" {
  type = list(object({
    name          = string
    column_family = string
  }))
  description = "List of Bigtable tables to create"
  validation {
    condition     = length(var.tables) > 0 && alltrue([for t in var.tables : length(t.name) > 0 && length(t.column_family) > 0])
    error_message = "tables must contain at least one table and each table must have non-empty 'name' and 'column_family'"
  }
}

variable "account_id" {
  type        = string
  description = "Account identifier (must not be empty)"
  validation {
    condition     = length(var.account_id) > 0
    error_message = "account_id must not be empty"
  }
}

variable "account_name" {
  type        = string
  description = "Account name (must not be empty)"
  validation {
    condition     = length(var.account_name) > 0
    error_message = "account_name must not be empty"
  }
}

variable "cluster" {
  type = object({
    cluster_id   = string
    storage_type = string
    zone         = string
    autoscaling_config = object({
      min_nodes      = number
      max_nodes      = number
      cpu_target     = string
      storage_target = string
    })

  })
  description = "Cluste Object"
  validation {
    condition     = var.cluster.autoscaling_config.min_nodes <= var.cluster.autoscaling_config.max_nodes
    error_message = "cluster.autoscaling_config.min_nodes must be less than or equal to cluster.autoscaling_config.max_nodes"
  }
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
  validation {
    condition     = length(var.project_id) > 0
    error_message = "project_id must not be empty"
  }
}


variable "deletion_protection" {
  type        = bool
  description = "Whether to enable deletion protection for the Bigtable instance"
  default     = true
}

variable "instance_name" {
  type        = string
  description = "Bigtable instance name"
  validation {
    condition     = length(var.instance_name) > 0
    error_message = "instance_name must not be empty"
  }
}

variable "instance_display_name" {
  type        = string
  description = "Bigtable instance display name"
  validation {
    condition     = length(var.instance_display_name) > 0
    error_message = "instance_display_name must not be empty"
  }
}

variable "kms_key_id" {
  type        = string
  description = "KMS key resource id (e.g. projects/PROJECT/locations/LOCATION/keyRings/KEYRING/cryptoKeys/KEY)."
  validation {
    condition     = can(regex("^projects/.+", var.kms_key_id))
    error_message = "kms_key_id must be a valid KMS resource id starting with 'projects/'."
  }
}
