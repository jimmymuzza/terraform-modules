variable "ec2_local_gateway_route_tables" {
  description = <<EOT
Map of ec2_local_gateway_route_tables, attributes below
Required:
    - local_gateway_id
    - mode
Optional:
    - region
    - tags
EOT

  type = map(object({
    local_gateway_id = string
    mode             = string
    region           = optional(string)
    tags             = optional(map(string))
  }))
}
