variable "efs_file_system_policies" {
  description = <<EOT
Map of efs_file_system_policies, attributes below
Required:
    - file_system_id
    - policy
Optional:
    - bypass_policy_lockout_safety_check
    - region
EOT

  type = map(object({
    file_system_id                     = string
    policy                             = string
    bypass_policy_lockout_safety_check = optional(bool)
    region                             = optional(string)
  }))
}
