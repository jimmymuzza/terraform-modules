variable "vpclattice_auth_policies" {
  description = <<EOT
Map of vpclattice_auth_policies, attributes below
Required:
    - policy
    - resource_identifier
Optional:
    - region
    - state
EOT

  type = map(object({
    policy              = string
    resource_identifier = string
    region              = optional(string)
    state               = optional(string)
  }))
}
