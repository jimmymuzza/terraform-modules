variable "redshift_partners" {
  description = <<EOT
Map of redshift_partners, attributes below
Required:
    - account_id
    - cluster_identifier
    - database_name
    - partner_name
Optional:
    - region
EOT

  type = map(object({
    account_id         = string
    cluster_identifier = string
    database_name      = string
    partner_name       = string
    region             = optional(string)
  }))
}
