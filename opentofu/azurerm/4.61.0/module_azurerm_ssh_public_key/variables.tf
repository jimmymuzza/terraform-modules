variable "ssh_public_keys" {
  description = <<EOT
Map of ssh_public_keys, attributes below
Required:
    - location
    - name
    - public_key
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    public_key          = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
