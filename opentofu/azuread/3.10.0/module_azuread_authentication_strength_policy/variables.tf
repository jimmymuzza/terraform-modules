variable "authentication_strength_policies" {
  description = <<EOT
Map of authentication_strength_policies, attributes below
Required:
    - allowed_combinations
    - display_name
Optional:
    - description
EOT

  type = map(object({
    allowed_combinations = set(string)
    display_name         = string
    description          = optional(string)
  }))
}
