variable "resiliencehubv2_assertions" {
  description = <<EOT
Map of resiliencehubv2_assertions, attributes below
Required:
    - service_arn
    - text
Optional:
    - region
EOT

  type = map(object({
    service_arn = string
    text        = string
    region      = optional(string)
  }))
}
