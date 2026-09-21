variable "cdn_frontdoor_origins" {
  description = <<EOT
Map of cdn_frontdoor_origins, attributes below
Required:
    - cdn_frontdoor_origin_group_id
    - certificate_name_check_enabled
    - host_name
    - name
Optional:
    - enabled
    - http_port
    - https_port
    - origin_host_header
    - priority
    - weight
    - private_link
EOT

  type = map(object({
    cdn_frontdoor_origin_group_id  = string
    certificate_name_check_enabled = bool
    host_name                      = string
    name                           = string
    enabled                        = optional(bool)
    http_port                      = optional(number)
    https_port                     = optional(number)
    origin_host_header             = optional(string)
    priority                       = optional(number)
    weight                         = optional(number)
    private_link                   = optional(list(object({
            location               = string
            private_link_target_id = string
            request_message        = optional(string)
            target_type            = optional(string)
        })))
  }))
}
