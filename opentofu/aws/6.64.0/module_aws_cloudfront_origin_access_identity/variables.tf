variable "cloudfront_origin_access_identities" {
  description = <<EOT
Map of cloudfront_origin_access_identities, attributes below
Optional:
    - comment
EOT

  type = map(object({
    comment = optional(string)
  }))
}
