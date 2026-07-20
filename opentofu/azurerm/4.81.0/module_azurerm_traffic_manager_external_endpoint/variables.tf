variable "traffic_manager_external_endpoints" {
  description = <<EOT
Map of traffic_manager_external_endpoints, attributes below
Required:
    - name
    - profile_id
    - target
Optional:
    - always_serve_enabled
    - enabled
    - endpoint_location
    - geo_mappings
    - priority
    - weight
    - custom_header
    - subnet
EOT

  type = map(object({
    name                 = string
    profile_id           = string
    target               = string
    always_serve_enabled = optional(bool)
    enabled              = optional(bool)
    endpoint_location    = optional(string)
    geo_mappings         = optional(list(string))
    priority             = optional(number)
    weight               = optional(number)
    custom_header        = optional(list(object({
            name  = string
            value = string
        })))
    subnet               = optional(list(object({
            first = string
            last  = optional(string)
            scope = optional(number)
        })))
  }))
}
