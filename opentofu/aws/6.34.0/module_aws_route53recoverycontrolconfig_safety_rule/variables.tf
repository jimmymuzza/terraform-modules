variable "route53recoverycontrolconfig_safety_rules" {
  description = <<EOT
Map of route53recoverycontrolconfig_safety_rules, attributes below
Required:
    - control_panel_arn
    - name
    - wait_period_ms
    - rule_config
Optional:
    - asserted_controls
    - gating_controls
    - tags
    - tags_all
    - target_controls
EOT

  type = map(object({
    control_panel_arn = string
    name              = string
    wait_period_ms    = number
    asserted_controls = optional(list(string))
    gating_controls   = optional(list(string))
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    target_controls   = optional(list(string))
    rule_config       = list(object({
            inverted  = bool
            threshold = number
            type      = string
        }))
  }))
}
