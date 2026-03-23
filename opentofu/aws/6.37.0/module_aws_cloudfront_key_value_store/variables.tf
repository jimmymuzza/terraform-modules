variable "cloudfront_key_value_stores" {
  description = <<EOT
Map of cloudfront_key_value_stores, attributes below
Required:
    - name
Optional:
    - comment
EOT

  type = map(object({
    name    = string
    comment = optional(string)
  }))
}
