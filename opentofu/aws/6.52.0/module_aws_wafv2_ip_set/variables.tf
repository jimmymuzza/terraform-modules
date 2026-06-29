variable "wafv2_ip_sets" {
  description = <<EOT
Map of wafv2_ip_sets, attributes below
Required:
    - ip_address_version
    - scope
Optional:
    - addresses
    - description
    - name
    - name_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    ip_address_version = string
    scope              = string
    addresses          = optional(set(string))
    description        = optional(string)
    name               = optional(string)
    name_prefix        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
