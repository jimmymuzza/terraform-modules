variable "cloudwatchomni_spaces" {
  description = <<EOT
Map of cloudwatchomni_spaces, attributes below
Required:
    - data_access_role_arn
    - domain_id
    - name
Optional:
    - agent_core_evaluation_role_arn
    - region
    - encryption_configuration
EOT

  type = map(object({
    data_access_role_arn           = string
    domain_id                      = string
    name                           = string
    agent_core_evaluation_role_arn = optional(string)
    region                         = optional(string)
    encryption_configuration       = optional(list(object({
            encryption_strategy = string
            kms_key_arn         = optional(string)
        })))
  }))
}
