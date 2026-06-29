variable "ssoadmin_managed_policy_attachments_exclusives" {
  description = <<EOT
Map of ssoadmin_managed_policy_attachments_exclusives, attributes below
Required:
    - instance_arn
    - managed_policy_arns
    - permission_set_arn
Optional:
    - region
EOT

  type = map(object({
    instance_arn        = string
    managed_policy_arns = set(string)
    permission_set_arn  = string
    region              = optional(string)
  }))
}
