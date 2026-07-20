variable "schemas_registry_policies" {
  description = <<EOT
Map of schemas_registry_policies, attributes below
Required:
    - policy
    - registry_name
Optional:
    - region
EOT

  type = map(object({
    policy        = string
    registry_name = string
    region        = optional(string)
  }))
}
