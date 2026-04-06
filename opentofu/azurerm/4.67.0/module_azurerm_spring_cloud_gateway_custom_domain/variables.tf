variable "spring_cloud_gateway_custom_domains" {
  description = <<EOT
Map of spring_cloud_gateway_custom_domains, attributes below
Required:
    - name
    - spring_cloud_gateway_id
Optional:
    - thumbprint
EOT

  type = map(object({
    name                    = string
    spring_cloud_gateway_id = string
    thumbprint              = optional(string)
  }))
}
