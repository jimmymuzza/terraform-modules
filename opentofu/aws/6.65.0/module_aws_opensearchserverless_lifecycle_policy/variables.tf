variable "opensearchserverless_lifecycle_policies" {
  description = <<EOT
Map of opensearchserverless_lifecycle_policies, attributes below
Required:
    - name
    - policy
    - type
Optional:
    - description
    - region
EOT

  type = map(object({
    name        = string
    policy      = string
    type        = string
    description = optional(string)
    region      = optional(string)
  }))
}
