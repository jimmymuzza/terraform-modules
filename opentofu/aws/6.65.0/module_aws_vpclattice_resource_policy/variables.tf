variable "vpclattice_resource_policies" {
  description = <<EOT
Map of vpclattice_resource_policies, attributes below
Required:
    - policy
    - resource_arn
Optional:
    - region
EOT

  type = map(object({
    policy       = string
    resource_arn = string
    region       = optional(string)
  }))
}
