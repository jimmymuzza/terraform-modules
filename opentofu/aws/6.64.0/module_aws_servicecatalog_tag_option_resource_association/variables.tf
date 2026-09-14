variable "servicecatalog_tag_option_resource_associations" {
  description = <<EOT
Map of servicecatalog_tag_option_resource_associations, attributes below
Required:
    - resource_id
    - tag_option_id
Optional:
    - region
EOT

  type = map(object({
    resource_id   = string
    tag_option_id = string
    region        = optional(string)
  }))
}
