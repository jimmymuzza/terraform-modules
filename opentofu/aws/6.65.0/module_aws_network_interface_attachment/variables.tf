variable "network_interface_attachments" {
  description = <<EOT
Map of network_interface_attachments, attributes below
Required:
    - device_index
    - instance_id
    - network_interface_id
Optional:
    - network_card_index
    - region
EOT

  type = map(object({
    device_index         = number
    instance_id          = string
    network_interface_id = string
    network_card_index   = optional(number)
    region               = optional(string)
  }))
}
