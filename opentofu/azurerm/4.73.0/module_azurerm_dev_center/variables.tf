variable "dev_centers" {
  description = <<EOT
Map of dev_centers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - project_catalog_item_sync_enabled
    - tags
    - identity
EOT

  type = map(object({
    location                          = string
    name                              = string
    resource_group_name               = string
    project_catalog_item_sync_enabled = optional(bool)
    tags                              = optional(map(string))
    identity                          = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
