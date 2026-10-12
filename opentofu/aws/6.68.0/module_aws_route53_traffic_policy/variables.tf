variable "route53_traffic_policies" {
  description = <<EOT
Map of route53_traffic_policies, attributes below
Required:
    - document
    - name
Optional:
    - comment
EOT

  type = map(object({
    document = string
    name     = string
    comment  = optional(string)
  }))
}
