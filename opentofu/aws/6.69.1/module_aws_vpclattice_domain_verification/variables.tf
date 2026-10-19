variable "vpclattice_domain_verifications" {
  description = <<EOT
Map of vpclattice_domain_verifications, attributes below
Required:
    - domain_name
Optional:
    - region
    - tags
EOT

  type = map(object({
    domain_name = string
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
