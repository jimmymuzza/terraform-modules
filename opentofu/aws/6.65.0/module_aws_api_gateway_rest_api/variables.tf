variable "api_gateway_rest_apis" {
  description = <<EOT
Map of api_gateway_rest_apis, attributes below
Required:
    - name
Optional:
    - api_key_source
    - binary_media_types
    - body
    - description
    - disable_execute_api_endpoint
    - endpoint_access_mode
    - fail_on_warnings
    - minimum_compression_size
    - parameters
    - policy
    - put_rest_api_mode
    - region
    - security_policy
    - tags
    - tags_all
    - endpoint_configuration
EOT

  type = map(object({
    name                         = string
    api_key_source               = optional(string)
    binary_media_types           = optional(list(string))
    body                         = optional(string)
    description                  = optional(string)
    disable_execute_api_endpoint = optional(bool)
    endpoint_access_mode         = optional(string)
    fail_on_warnings             = optional(bool)
    minimum_compression_size     = optional(string)
    parameters                   = optional(map(string))
    policy                       = optional(string)
    put_rest_api_mode            = optional(string)
    region                       = optional(string)
    security_policy              = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    endpoint_configuration       = optional(list(object({
            types            = list(string)
            ip_address_type  = optional(string)
            vpc_endpoint_ids = optional(set(string))
        })))
  }))
}
