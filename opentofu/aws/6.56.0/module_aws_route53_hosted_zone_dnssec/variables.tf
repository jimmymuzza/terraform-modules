variable "route53_hosted_zone_dnssecs" {
  description = <<EOT
Map of route53_hosted_zone_dnssecs, attributes below
Required:
    - hosted_zone_id
Optional:
    - signing_status
EOT

  type = map(object({
    hosted_zone_id = string
    signing_status = optional(string)
  }))
}
