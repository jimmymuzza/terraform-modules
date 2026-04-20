variable "api_gateway_vpc_links" {
  description = <<EOT
Map of api_gateway_vpc_links, attributes below
Required:
    - name
    - target_arns
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    target_arns = list(string)
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
