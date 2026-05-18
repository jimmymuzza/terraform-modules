variable "dynamodb_tags" {
  description = <<EOT
Map of dynamodb_tags, attributes below
Required:
    - key
    - resource_arn
    - value
Optional:
    - region
EOT

  type = map(object({
    key          = string
    resource_arn = string
    value        = string
    region       = optional(string)
  }))
}
