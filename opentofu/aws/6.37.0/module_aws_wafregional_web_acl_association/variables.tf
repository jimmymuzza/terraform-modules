variable "wafregional_web_acl_associations" {
  description = <<EOT
Map of wafregional_web_acl_associations, attributes below
Required:
    - resource_arn
    - web_acl_id
Optional:
    - region
EOT

  type = map(object({
    resource_arn = string
    web_acl_id   = string
    region       = optional(string)
  }))
}
