variable "quicksight_namespaces" {
  description = <<EOT
Map of quicksight_namespaces, attributes below
Required:
    - namespace
Optional:
    - aws_account_id
    - identity_store
    - region
    - tags
EOT

  type = map(object({
    namespace      = string
    aws_account_id = optional(string)
    identity_store = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
  }))
}
