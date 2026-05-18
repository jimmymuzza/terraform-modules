variable "spring_cloud_gateway_route_configs" {
  description = <<EOT
Map of spring_cloud_gateway_route_configs, attributes below
Required:
    - name
    - protocol
    - spring_cloud_gateway_id
Optional:
    - filters
    - predicates
    - spring_cloud_app_id
    - sso_validation_enabled
    - open_api
    - route
EOT

  type = map(object({
    name                    = string
    protocol                = string
    spring_cloud_gateway_id = string
    filters                 = optional(set(string))
    predicates              = optional(set(string))
    spring_cloud_app_id     = optional(string)
    sso_validation_enabled  = optional(bool)
    open_api                = optional(list(object({
            uri = optional(string)
        })))
    route                   = optional(set(object({
            order                  = number
            classification_tags    = optional(set(string))
            description            = optional(string)
            filters                = optional(set(string))
            predicates             = optional(set(string))
            sso_validation_enabled = optional(bool)
            title                  = optional(string)
            token_relay            = optional(bool)
            uri                    = optional(string)
        })))
  }))
}
