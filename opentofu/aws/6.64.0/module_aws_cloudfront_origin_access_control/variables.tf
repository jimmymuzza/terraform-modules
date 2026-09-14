variable "cloudfront_origin_access_controls" {
  description = <<EOT
Map of cloudfront_origin_access_controls, attributes below
Required:
    - name
    - origin_access_control_origin_type
    - signing_behavior
    - signing_protocol
Optional:
    - description
EOT

  type = map(object({
    name                              = string
    origin_access_control_origin_type = string
    signing_behavior                  = string
    signing_protocol                  = string
    description                       = optional(string)
  }))
}
