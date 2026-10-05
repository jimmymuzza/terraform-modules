variable "sesv2_dedicated_ip_pools" {
  description = <<EOT
Map of sesv2_dedicated_ip_pools, attributes below
Required:
    - pool_name
Optional:
    - region
    - scaling_mode
    - tags
    - tags_all
EOT

  type = map(object({
    pool_name    = string
    region       = optional(string)
    scaling_mode = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
