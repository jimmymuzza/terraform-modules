variable "organizations_accounts" {
  description = <<EOT
Map of organizations_accounts, attributes below
Required:
    - email
    - name
Optional:
    - close_on_deletion
    - create_govcloud
    - iam_user_access_to_billing
    - parent_id
    - role_name
    - tags
    - tags_all
EOT

  type = map(object({
    email                      = string
    name                       = string
    close_on_deletion          = optional(bool)
    create_govcloud            = optional(bool)
    iam_user_access_to_billing = optional(string)
    parent_id                  = optional(string)
    role_name                  = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
  }))
}
