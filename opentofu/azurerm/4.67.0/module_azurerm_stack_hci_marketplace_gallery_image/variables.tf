variable "stack_hci_marketplace_gallery_images" {
  description = <<EOT
Map of stack_hci_marketplace_gallery_images, attributes below
Required:
    - custom_location_id
    - hyperv_generation
    - location
    - name
    - os_type
    - resource_group_name
    - version
    - identifier
Optional:
    - storage_path_id
    - tags
EOT

  type = map(object({
    custom_location_id  = string
    hyperv_generation   = string
    location            = string
    name                = string
    os_type             = string
    resource_group_name = string
    version             = string
    storage_path_id     = optional(string)
    tags                = optional(map(string))
    identifier          = list(object({
            offer     = string
            publisher = string
            sku       = string
        }))
  }))
}
