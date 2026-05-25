variable "securityhub_automation_rule_v2s" {
  description = <<EOT
Map of securityhub_automation_rule_v2s, attributes below
Required:
    - description
    - rule_name
    - rule_order
Optional:
    - region
    - rule_status
    - tags
    - action
    - criteria
EOT

  type = map(object({
    description = string
    rule_name   = string
    rule_order  = number
    region      = optional(string)
    rule_status = optional(string)
    tags        = optional(map(string))
    action      = optional(list(object({
            type                               = string
            external_integration_configuration = optional(list(object({
                connector_arn = string
            })))
            finding_fields_update              = optional(list(object({
                comment     = optional(string)
                severity_id = optional(number)
                status_id   = optional(number)
            })))
        })))
    criteria    = optional(list(object({
            ocsf_finding_criteria_json = string
        })))
  }))
}
