variable "load_tests" {
  description = <<EOT
Map of load_tests, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - description
    - tags
    - encryption
    - identity
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    description         = optional(string)
    tags                = optional(map(string))
    encryption          = optional(list(object({
            key_url  = string
            identity = list(object({
                identity_id = string
                type        = string
            }))
        })))
    identity            = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
  }))
}
