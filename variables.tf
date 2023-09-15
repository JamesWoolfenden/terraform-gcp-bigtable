variable "members" {
  type        = list(string)
  description = ""
}

variable "tables" {
  type = list(object({
    name          = string
    column_family = string
  }))
  description = ""
}

variable "account_id" {
  type        = string
  description = ""
}

variable "account_name" {
  type        = string
  description = ""
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
  description = ""
}

variable "project_id" {
  type = string
}

variable "labels" {
  type        = map(any)
  description = ""
}

variable "rotation_period" {
  type        = string
  description = ""
}

variable "name" {
  type        = string
  description = ""
}

variable "deletion_protection" {
  type    = bool
  default = true
}
