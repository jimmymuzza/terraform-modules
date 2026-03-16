variable "networkmanager_customer_gateway_associations" {
  description = <<EOT
Map of networkmanager_customer_gateway_associations, attributes below
Required:
    - customer_gateway_arn
    - device_id
    - global_network_id
Optional:
    - link_id
EOT

  type = map(object({
    customer_gateway_arn = string
    device_id            = string
    global_network_id    = string
    link_id              = optional(string)
  }))
}
