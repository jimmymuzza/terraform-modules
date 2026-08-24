variable "dev_test_windows_virtual_machines" {
  description = <<EOT
Map of dev_test_windows_virtual_machines, attributes below
Required:
    - lab_name
    - lab_subnet_name
    - lab_virtual_network_id
    - location
    - name
    - password
    - resource_group_name
    - size
    - storage_type
    - username
    - gallery_image_reference
Optional:
    - allow_claim
    - disallow_public_ip_address
    - notes
    - tags
    - inbound_nat_rule
EOT

  type = map(object({
    lab_name                   = string
    lab_subnet_name            = string
    lab_virtual_network_id     = string
    location                   = string
    name                       = string
    password                   = string
    resource_group_name        = string
    size                       = string
    storage_type               = string
    username                   = string
    allow_claim                = optional(bool)
    disallow_public_ip_address = optional(bool)
    notes                      = optional(string)
    tags                       = optional(map(string))
    gallery_image_reference    = list(object({
            offer     = string
            publisher = string
            sku       = string
            version   = string
        }))
    inbound_nat_rule           = optional(set(object({
            backend_port = number
            protocol     = string
        })))
  }))
}
