variable "workmail_domains" {
  description = <<EOT
Map of workmail_domains, attributes below
Required:
    - domain_name
    - organization_id
Optional:
    - region
EOT

  type = map(object({
    domain_name     = string
    organization_id = string
    region          = optional(string)
  }))
}
