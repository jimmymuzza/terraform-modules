variable "route53_cidr_collections" {
  description = <<EOT
Map of route53_cidr_collections, attributes below
Required:
    - name
EOT

  type = map(object({
    name = string
  }))
}
