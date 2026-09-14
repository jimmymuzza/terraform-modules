variable "management_group_subscription_associations" {
  description = <<EOT
Map of management_group_subscription_associations, attributes below
Required:
    - management_group_id
    - subscription_id
EOT

  type = map(object({
    management_group_id = string
    subscription_id     = string
  }))
}
