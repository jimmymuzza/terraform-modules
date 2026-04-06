variable "subnet_service_endpoint_storage_policies" {
  description = <<EOT
Map of subnet_service_endpoint_storage_policies, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - definition
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    definition          = optional(list(object({
            name              = string
            service_resources = set(string)
            description       = optional(string)
            service           = optional(string)
        })))
  }))
}
