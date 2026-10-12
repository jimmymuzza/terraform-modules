variable "iot_policy_attachments" {
  description = <<EOT
Map of iot_policy_attachments, attributes below
Required:
    - policy
    - target
Optional:
    - region
EOT

  type = map(object({
    policy = string
    target = string
    region = optional(string)
  }))
}
