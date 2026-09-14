variable "cloudfront_key_groups" {
  description = <<EOT
Map of cloudfront_key_groups, attributes below
Required:
    - items
    - name
Optional:
    - comment
EOT

  type = map(object({
    items   = set(string)
    name    = string
    comment = optional(string)
  }))
}
