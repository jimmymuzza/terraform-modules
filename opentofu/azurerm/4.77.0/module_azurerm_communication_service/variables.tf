variable "communication_services" {
  description = <<EOT
Map of communication_services, attributes below
Required:
    - name
    - resource_group_name
Optional:
    - data_location
    - tags
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    data_location       = optional(string)
    tags                = optional(map(string))
  }))
}
