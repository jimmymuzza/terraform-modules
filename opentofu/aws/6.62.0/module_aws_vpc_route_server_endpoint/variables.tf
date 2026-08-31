variable "vpc_route_server_endpoints" {
  description = <<EOT
Map of vpc_route_server_endpoints, attributes below
Required:
    - route_server_id
    - subnet_id
Optional:
    - region
    - tags
EOT

  type = map(object({
    route_server_id = string
    subnet_id       = string
    region          = optional(string)
    tags            = optional(map(string))
  }))
}
