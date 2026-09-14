variable "redshift_snapshot_copies" {
  description = <<EOT
Map of redshift_snapshot_copies, attributes below
Required:
    - cluster_identifier
    - destination_region
Optional:
    - manual_snapshot_retention_period
    - region
    - retention_period
    - snapshot_copy_grant_name
EOT

  type = map(object({
    cluster_identifier               = string
    destination_region               = string
    manual_snapshot_retention_period = optional(number)
    region                           = optional(string)
    retention_period                 = optional(number)
    snapshot_copy_grant_name         = optional(string)
  }))
}
