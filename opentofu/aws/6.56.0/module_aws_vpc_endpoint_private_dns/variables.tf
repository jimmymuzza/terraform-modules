variable "vpc_endpoint_private_dns" {
  description = <<EOT
Map of vpc_endpoint_private_dns, attributes below
Required:
    - private_dns_enabled
    - vpc_endpoint_id
Optional:
    - region
EOT

  type = map(object({
    private_dns_enabled = bool
    vpc_endpoint_id     = string
    region              = optional(string)
  }))
}
