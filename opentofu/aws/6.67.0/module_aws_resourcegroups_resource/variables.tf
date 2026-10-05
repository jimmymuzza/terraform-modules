variable "resourcegroups_resources" {
  description = <<EOT
Map of resourcegroups_resources, attributes below
Required:
    - group_arn
    - resource_arn
Optional:
    - region
EOT

  type = map(object({
    group_arn    = string
    resource_arn = string
    region       = optional(string)
  }))
}
