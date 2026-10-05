variable "opensearchserverless_security_policies" {
  description = <<EOT
Map of opensearchserverless_security_policies, attributes below
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
