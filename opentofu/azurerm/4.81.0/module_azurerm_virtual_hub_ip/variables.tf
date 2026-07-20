variable "virtual_hub_ips" {
  description = <<EOT
Map of virtual_hub_ips, attributes below
Required:
    - name
    - public_ip_address_id
    - subnet_id
    - virtual_hub_id
Optional:
    - private_ip_address
    - private_ip_allocation_method
EOT

  type = map(object({
    name                         = string
    public_ip_address_id         = string
    subnet_id                    = string
    virtual_hub_id               = string
    private_ip_address           = optional(string)
    private_ip_allocation_method = optional(string)
  }))
}
