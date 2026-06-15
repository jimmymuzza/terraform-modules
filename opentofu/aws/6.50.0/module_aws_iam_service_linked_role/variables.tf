variable "iam_service_linked_roles" {
  description = <<EOT
Map of iam_service_linked_roles, attributes below
Required:
    - aws_service_name
Optional:
    - custom_suffix
    - description
    - tags
    - tags_all
EOT

  type = map(object({
    aws_service_name = string
    custom_suffix    = optional(string)
    description      = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
