variable "stack_hci_storage_paths" {
  description = <<EOT
Map of stack_hci_storage_paths, attributes below
Required:
    - custom_location_id
    - location
    - name
    - path
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    custom_location_id  = string
    location            = string
    name                = string
    path                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
