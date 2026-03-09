variable "cdn_frontdoor_endpoints" {
  description = <<EOT
Map of cdn_frontdoor_endpoints, attributes below
Required:
    - cdn_frontdoor_profile_id
    - name
Optional:
    - enabled
    - tags
EOT

  type = map(object({
    cdn_frontdoor_profile_id = string
    name                     = string
    enabled                  = optional(bool)
    tags                     = optional(map(string))
  }))
}
