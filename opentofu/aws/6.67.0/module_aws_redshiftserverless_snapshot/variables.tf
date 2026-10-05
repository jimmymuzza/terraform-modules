variable "redshiftserverless_snapshots" {
  description = <<EOT
Map of redshiftserverless_snapshots, attributes below
Required:
    - namespace_name
    - snapshot_name
Optional:
    - region
    - retention_period
EOT

  type = map(object({
    namespace_name   = string
    snapshot_name    = string
    region           = optional(string)
    retention_period = optional(number)
  }))
}
