variable "traffic_manager_azure_endpoints" {
  description = <<EOT
Map of traffic_manager_azure_endpoints, attributes below
Required:
    - name
    - profile_id
    - target_resource_id
Optional:
    - always_serve_enabled
    - enabled
    - geo_mappings
    - priority
    - weight
    - custom_header
    - subnet
EOT

  type = map(object({
    name                 = string
    profile_id           = string
    target_resource_id   = string
    always_serve_enabled = optional(bool)
    enabled              = optional(bool)
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
