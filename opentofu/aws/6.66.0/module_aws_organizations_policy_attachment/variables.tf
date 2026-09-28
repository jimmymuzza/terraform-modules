variable "organizations_policy_attachments" {
  description = <<EOT
Map of organizations_policy_attachments, attributes below
Required:
    - policy_id
    - target_id
Optional:
    - skip_destroy
EOT

  type = map(object({
    policy_id    = string
    target_id    = string
    skip_destroy = optional(bool)
  }))
}
