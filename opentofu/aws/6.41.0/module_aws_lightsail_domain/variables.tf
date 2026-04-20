variable "lightsail_domains" {
  description = <<EOT
Map of lightsail_domains, attributes below
Required:
    - domain_name
Optional:
    - region
EOT

  type = map(object({
    domain_name = string
    region      = optional(string)
  }))
}
