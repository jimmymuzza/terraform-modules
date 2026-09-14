variable "cloudfront_anycast_ip_lists" {
  description = <<EOT
Map of cloudfront_anycast_ip_lists, attributes below
Required:
    - ip_count
    - name
Optional:
    - tags
EOT

  type = map(object({
    ip_count = number
    name     = string
    tags     = optional(map(string))
  }))
}
