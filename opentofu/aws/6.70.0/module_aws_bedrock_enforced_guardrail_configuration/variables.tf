variable "bedrock_enforced_guardrail_configurations" {
  description = <<EOT
Map of bedrock_enforced_guardrail_configurations, attributes below
Required:
    - guardrail_arn
    - guardrail_version
Optional:
    - region
    - model_enforcement
    - selective_content_guarding
EOT

  type = map(object({
    guardrail_arn              = string
    guardrail_version          = string
    region                     = optional(string)
    model_enforcement          = optional(list(object({
            excluded_models = list(string)
            included_models = list(string)
        })))
    selective_content_guarding = optional(list(object({
            messages = optional(string)
            system   = optional(string)
        })))
  }))
}
