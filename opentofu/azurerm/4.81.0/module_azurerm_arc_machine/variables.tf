variable "arc_machines" {
  description = <<EOT
Map of arc_machines, attributes below
Required:
    - kind
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - identity
EOT

  type = map(object({
    kind                = string
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    identity            = optional(list(object({
            type = string
        })))
  }))
}
