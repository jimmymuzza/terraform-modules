variable "cloudwatch_event_bus" {
  description = <<EOT
Map of cloudwatch_event_bus, attributes below
Required:
    - name
Optional:
    - description
    - event_source_name
    - kms_key_identifier
    - region
    - tags
    - tags_all
    - dead_letter_config
    - log_config
EOT

  type = map(object({
    name               = string
    description        = optional(string)
    event_source_name  = optional(string)
    kms_key_identifier = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    dead_letter_config = optional(list(object({
            arn = optional(string)
        })))
    log_config         = optional(list(object({
            include_detail = optional(string)
            level          = optional(string)
        })))
  }))
}
