variable "powerbi_embeddeds" {
  description = <<EOT
Map of powerbi_embeddeds, attributes below
Required:
    - administrators
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - mode
    - tags
EOT

  type = map(object({
    administrators      = set(string)
    location            = string
    name                = string
    resource_group_name = string
    sku_name            = string
    mode                = optional(string)
    tags                = optional(map(string))
  }))
}
