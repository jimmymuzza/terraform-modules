variable "odb_iam_role_associations" {
  description = <<EOT
Map of odb_iam_role_associations, attributes below
Required:
    - aws_integration
    - iam_role_arn
    - resource_arn
Optional:
    - region
EOT

  type = map(object({
    aws_integration = string
    iam_role_arn    = string
    resource_arn    = string
    region          = optional(string)
  }))
}
