variable "sesv2_multi_region_endpoints" {
  description = <<EOT
Map of sesv2_multi_region_endpoints, attributes below
Required:
    - endpoint_name
Optional:
    - region
    - tags
    - details
EOT

  type = map(object({
    endpoint_name = string
    region        = optional(string)
    tags          = optional(map(string))
    details       = optional(list(object({
            routes_details = optional(list(object({
                region = string
            })))
        })))
  }))
}
