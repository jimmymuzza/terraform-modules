variable "msk_scram_secret_associations" {
  description = <<EOT
Map of msk_scram_secret_associations, attributes below
Required:
    - cluster_arn
    - secret_arn_list
Optional:
    - region
EOT

  type = map(object({
    cluster_arn     = string
    secret_arn_list = set(string)
    region          = optional(string)
  }))
}
