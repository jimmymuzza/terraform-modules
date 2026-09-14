variable "quicksight_folder_memberships" {
  description = <<EOT
Map of quicksight_folder_memberships, attributes below
Required:
    - folder_id
    - member_id
    - member_type
Optional:
    - aws_account_id
    - region
EOT

  type = map(object({
    folder_id      = string
    member_id      = string
    member_type    = string
    aws_account_id = optional(string)
    region         = optional(string)
  }))
}
