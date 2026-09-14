variable "dsql_cluster_policies" {
  description = <<EOT
Map of dsql_cluster_policies, attributes below
Required:
    - identifier
    - policy
Optional:
    - bypass_policy_lockout_safety_check
    - region
EOT

  type = map(object({
    identifier                         = string
    policy                             = string
    bypass_policy_lockout_safety_check = optional(bool)
    region                             = optional(string)
  }))
}
