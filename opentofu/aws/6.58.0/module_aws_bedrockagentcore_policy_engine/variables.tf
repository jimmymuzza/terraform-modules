variable "bedrockagentcore_policy_engines" {
  description = <<EOT
Map of bedrockagentcore_policy_engines, attributes below
Required:
    - name
Optional:
    - description
    - encryption_key_arn
    - region
    - tags
EOT

  type = map(object({
    name               = string
    description        = optional(string)
    encryption_key_arn = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
