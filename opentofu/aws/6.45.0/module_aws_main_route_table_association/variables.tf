variable "main_route_table_associations" {
  description = <<EOT
Map of main_route_table_associations, attributes below
Required:
    - route_table_id
    - vpc_id
Optional:
    - region
EOT

  type = map(object({
    route_table_id = string
    vpc_id         = string
    region         = optional(string)
  }))
}
