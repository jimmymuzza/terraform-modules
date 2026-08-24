variable "communication_services" {
  description = <<EOT
Map of communication_services, attributes below
Required:
    - data_location
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    data_location       = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
