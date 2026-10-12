variable "iam_account_alias" {
  description = <<EOT
Map of iam_account_alias, attributes below
Required:
    - account_alias
EOT

  type = map(object({
    account_alias = string
  }))
}
