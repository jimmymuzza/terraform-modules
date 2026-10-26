variable "vpc_endpoint_connection_accepters" {
  description = <<EOT
Map of vpc_endpoint_connection_accepters, attributes below
Required:
    - vpc_endpoint_id
    - vpc_endpoint_service_id
Optional:
    - region
EOT

  type = map(object({
    vpc_endpoint_id         = string
    vpc_endpoint_service_id = string
    region                  = optional(string)
  }))
}
