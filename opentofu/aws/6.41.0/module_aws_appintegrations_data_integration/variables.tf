variable "appintegrations_data_integrations" {
  description = <<EOT
Map of appintegrations_data_integrations, attributes below
Required:
    - kms_key
    - name
    - source_uri
    - schedule_config
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    kms_key         = string
    name            = string
    source_uri      = string
    description     = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    schedule_config = list(object({
            first_execution_from = string
            object               = string
            schedule_expression  = string
        }))
  }))
}
