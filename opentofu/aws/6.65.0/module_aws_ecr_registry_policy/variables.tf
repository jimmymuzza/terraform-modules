variable "ecr_registry_policies" {
  description = <<EOT
Map of ecr_registry_policies, attributes below
Required:
    - policy
Optional:
    - region
EOT

  type = map(object({
    policy = string
    region = optional(string)
  }))
}
