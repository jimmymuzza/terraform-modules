variable "spring_cloud_api_portals" {
  description = <<EOT
Map of spring_cloud_api_portals, attributes below
Required:
    - name
    - spring_cloud_service_id
Optional:
    - api_try_out_enabled
    - gateway_ids
    - https_only_enabled
    - instance_count
    - public_network_access_enabled
    - sso
EOT

  type = map(object({
    name                          = string
    spring_cloud_service_id       = string
    api_try_out_enabled           = optional(bool)
    gateway_ids                   = optional(set(string))
    https_only_enabled            = optional(bool)
    instance_count                = optional(number)
    public_network_access_enabled = optional(bool)
    sso                           = optional(list(object({
            client_id     = optional(string)
            client_secret = optional(string)
            issuer_uri    = optional(string)
            scope         = optional(set(string))
        })))
  }))
}
