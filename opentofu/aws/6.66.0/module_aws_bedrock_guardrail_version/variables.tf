variable "bedrock_guardrail_versions" {
  description = <<EOT
Map of bedrock_guardrail_versions, attributes below
Required:
    - guardrail_arn
Optional:
    - description
    - region
    - skip_destroy
EOT

  type = map(object({
    guardrail_arn = string
    description   = optional(string)
    region        = optional(string)
    skip_destroy  = optional(bool)
  }))
}
