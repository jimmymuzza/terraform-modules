variable "opensearch_authorize_vpc_endpoint_accesses" {
  description = <<EOT
Map of opensearch_authorize_vpc_endpoint_accesses, attributes below
Required:
    - account
    - domain_name
Optional:
    - region
EOT

  type = map(object({
    account     = string
    domain_name = string
    region      = optional(string)
  }))
}
