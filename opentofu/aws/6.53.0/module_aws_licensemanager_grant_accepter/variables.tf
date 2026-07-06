variable "licensemanager_grant_accepters" {
  description = <<EOT
Map of licensemanager_grant_accepters, attributes below
Required:
    - grant_arn
Optional:
    - region
EOT

  type = map(object({
    grant_arn = string
    region    = optional(string)
  }))
}
