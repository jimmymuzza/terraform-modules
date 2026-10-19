variable "dev_center_dev_box_definitions" {
  description = <<EOT
Map of dev_center_dev_box_definitions, attributes below
Required:
    - dev_center_id
    - image_reference_id
    - location
    - name
    - sku_name
Optional:
    - hibernate_support_enabled
    - tags
EOT

  type = map(object({
    dev_center_id             = string
    image_reference_id        = string
    location                  = string
    name                      = string
    sku_name                  = string
    hibernate_support_enabled = optional(bool)
    tags                      = optional(map(string))
  }))
}
