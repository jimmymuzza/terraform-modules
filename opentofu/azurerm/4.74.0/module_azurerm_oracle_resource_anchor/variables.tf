variable "oracle_resource_anchors" {
  description = <<EOT
Map of oracle_resource_anchors, attributes below
Required:
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
