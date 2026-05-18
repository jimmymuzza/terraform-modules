variable "servicecatalog_budget_resource_associations" {
  description = <<EOT
Map of servicecatalog_budget_resource_associations, attributes below
Required:
    - budget_name
    - resource_id
Optional:
    - region
EOT

  type = map(object({
    budget_name = string
    resource_id = string
    region      = optional(string)
  }))
}
