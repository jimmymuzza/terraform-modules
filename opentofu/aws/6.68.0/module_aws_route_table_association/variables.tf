variable "route_table_associations" {
  description = <<EOT
Map of route_table_associations, attributes below
Required:
    - route_table_id
Optional:
    - gateway_id
    - region
    - subnet_id
EOT

  type = map(object({
    route_table_id = string
    gateway_id     = optional(string)
    region         = optional(string)
    subnet_id      = optional(string)
  }))
}
