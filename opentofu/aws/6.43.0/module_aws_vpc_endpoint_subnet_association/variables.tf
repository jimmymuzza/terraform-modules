variable "vpc_endpoint_subnet_associations" {
  description = <<EOT
Map of vpc_endpoint_subnet_associations, attributes below
Required:
    - subnet_id
    - vpc_endpoint_id
Optional:
    - region
EOT

  type = map(object({
    subnet_id       = string
    vpc_endpoint_id = string
    region          = optional(string)
  }))
}
