variable "globalaccelerator_accelerators" {
  description = <<EOT
Map of globalaccelerator_accelerators, attributes below
Required:
    - name
Optional:
    - enabled
    - ip_address_type
    - ip_addresses
    - tags
    - tags_all
    - attributes
EOT

  type = map(object({
    name            = string
    enabled         = optional(bool)
    ip_address_type = optional(string)
    ip_addresses    = optional(list(string))
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    attributes      = optional(list(object({
            flow_logs_enabled   = optional(bool)
            flow_logs_s3_bucket = optional(string)
            flow_logs_s3_prefix = optional(string)
        })))
  }))
}
