variable "storagegateway_file_system_associations" {
  description = <<EOT
Map of storagegateway_file_system_associations, attributes below
Required:
    - gateway_arn
    - location_arn
    - password
    - username
Optional:
    - audit_destination_arn
    - region
    - tags
    - tags_all
    - cache_attributes
EOT

  type = map(object({
    gateway_arn           = string
    location_arn          = string
    password              = string
    username              = string
    audit_destination_arn = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    cache_attributes      = optional(list(object({
            cache_stale_timeout_in_seconds = optional(number)
        })))
  }))
}
