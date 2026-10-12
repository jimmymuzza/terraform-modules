variable "route53_cidr_locations" {
  description = <<EOT
Map of route53_cidr_locations, attributes below
Required:
    - cidr_blocks
    - cidr_collection_id
    - name
EOT

  type = map(object({
    cidr_blocks        = set(string)
    cidr_collection_id = string
    name               = string
  }))
}
