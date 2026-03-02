variable "prometheus_workspaces" {
  description = <<EOT
Map of prometheus_workspaces, attributes below
Optional:
    - alias
    - kms_key_arn
    - region
    - tags
    - tags_all
    - logging_configuration
EOT

  type = map(object({
    alias                 = optional(string)
    kms_key_arn           = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    logging_configuration = optional(list(object({
            log_group_arn = string
        })))
  }))
}
