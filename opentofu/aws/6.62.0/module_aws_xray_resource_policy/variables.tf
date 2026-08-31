variable "xray_resource_policies" {
  description = <<EOT
Map of xray_resource_policies, attributes below
Required:
    - policy_document
    - policy_name
Optional:
    - bypass_policy_lockout_check
    - policy_revision_id
    - region
EOT

  type = map(object({
    policy_document             = string
    policy_name                 = string
    bypass_policy_lockout_check = optional(bool)
    policy_revision_id          = optional(string)
    region                      = optional(string)
  }))
}
