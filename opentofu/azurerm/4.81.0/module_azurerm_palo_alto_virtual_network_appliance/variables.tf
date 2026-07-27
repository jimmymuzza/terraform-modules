variable "palo_alto_virtual_network_appliances" {
  description = <<EOT
Map of palo_alto_virtual_network_appliances, attributes below
Required:
    - name
    - virtual_hub_id
EOT

  type = map(object({
    name           = string
    virtual_hub_id = string
  }))
}
