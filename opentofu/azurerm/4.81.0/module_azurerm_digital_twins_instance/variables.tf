variable "digital_twins_instances" {
  description = <<EOT
Map of digital_twins_instances, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - identity
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    identity            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
