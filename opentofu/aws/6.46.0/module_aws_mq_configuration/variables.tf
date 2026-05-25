variable "mq_configurations" {
  description = <<EOT
Map of mq_configurations, attributes below
Required:
    - data
    - engine_type
    - engine_version
    - name
Optional:
    - authentication_strategy
    - description
    - region
    - skip_destroy
    - tags
    - tags_all
EOT

  type = map(object({
    data                    = string
    engine_type             = string
    engine_version          = string
    name                    = string
    authentication_strategy = optional(string)
    description             = optional(string)
    region                  = optional(string)
    skip_destroy            = optional(bool)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
  }))
}
