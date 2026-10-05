variable "securitylake_subscribers" {
  description = <<EOT
Map of securitylake_subscribers, attributes below
Optional:
    - access_type
    - region
    - subscriber_description
    - subscriber_name
    - tags
    - source
    - subscriber_identity
EOT

  type = map(object({
    access_type            = optional(string)
    region                 = optional(string)
    subscriber_description = optional(string)
    subscriber_name        = optional(string)
    tags                   = optional(map(string))
    source                 = optional(set(object({
            aws_log_source_resource    = optional(list(object({
                source_name    = string
                source_version = optional(string)
            })))
            custom_log_source_resource = optional(list(object({
                source_name    = string
                source_version = optional(string)
            })))
        })))
    subscriber_identity    = optional(list(object({
            external_id = string
            principal   = string
        })))
  }))
}
