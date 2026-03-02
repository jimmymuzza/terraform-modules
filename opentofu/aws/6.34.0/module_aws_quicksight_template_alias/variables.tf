variable "quicksight_template_alias" {
  description = <<EOT
Map of quicksight_template_alias, attributes below
Required:
    - alias_name
    - template_id
    - template_version_number
Optional:
    - aws_account_id
    - region
EOT

  type = map(object({
    alias_name              = string
    template_id             = string
    template_version_number = number
    aws_account_id          = optional(string)
    region                  = optional(string)
  }))
}
