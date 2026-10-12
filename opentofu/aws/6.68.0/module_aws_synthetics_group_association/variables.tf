variable "synthetics_group_associations" {
  description = <<EOT
Map of synthetics_group_associations, attributes below
Required:
    - canary_arn
    - group_name
Optional:
    - region
EOT

  type = map(object({
    canary_arn = string
    group_name = string
    region     = optional(string)
  }))
}
