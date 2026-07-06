variable "quicksight_folders" {
  description = <<EOT
Map of quicksight_folders, attributes below
Required:
    - folder_id
Optional:
    - aws_account_id
    - folder_type
    - name
    - parent_folder_arn
    - region
    - tags
    - tags_all
    - permissions
EOT

  type = map(object({
    folder_id         = string
    aws_account_id    = optional(string)
    folder_type       = optional(string)
    name              = optional(string)
    parent_folder_arn = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    permissions       = optional(set(object({
            actions   = set(string)
            principal = string
        })))
  }))
}
