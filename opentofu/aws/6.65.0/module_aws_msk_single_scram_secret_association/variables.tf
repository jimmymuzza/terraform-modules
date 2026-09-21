variable "msk_single_scram_secret_associations" {
  description = <<EOT
Map of msk_single_scram_secret_associations, attributes below
Required:
    - cluster_arn
    - secret_arn
Optional:
    - region
EOT

  type = map(object({
    cluster_arn = string
    secret_arn  = string
    region      = optional(string)
  }))
}
