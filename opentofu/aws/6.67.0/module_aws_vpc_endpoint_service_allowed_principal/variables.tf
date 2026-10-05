variable "vpc_endpoint_service_allowed_principals" {
  description = <<EOT
Map of vpc_endpoint_service_allowed_principals, attributes below
Required:
    - principal_arn
    - vpc_endpoint_service_id
Optional:
    - region
EOT

  type = map(object({
    principal_arn           = string
    vpc_endpoint_service_id = string
    region                  = optional(string)
  }))
}
