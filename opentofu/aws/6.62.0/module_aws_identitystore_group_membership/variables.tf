variable "identitystore_group_memberships" {
  description = <<EOT
Map of identitystore_group_memberships, attributes below
Required:
    - group_id
    - identity_store_id
    - member_id
Optional:
    - region
EOT

  type = map(object({
    group_id          = string
    identity_store_id = string
    member_id         = string
    region            = optional(string)
  }))
}
