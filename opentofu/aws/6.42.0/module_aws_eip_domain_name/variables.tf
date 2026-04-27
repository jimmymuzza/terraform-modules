variable "eip_domain_names" {
  description = <<EOT
Map of eip_domain_names, attributes below
Required:
    - allocation_id
    - domain_name
Optional:
    - region
EOT

  type = map(object({
    allocation_id = string
    domain_name   = string
    region        = optional(string)
  }))
}
