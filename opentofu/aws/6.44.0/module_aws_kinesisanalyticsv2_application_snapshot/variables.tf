variable "kinesisanalyticsv2_application_snapshots" {
  description = <<EOT
Map of kinesisanalyticsv2_application_snapshots, attributes below
Required:
    - application_name
    - snapshot_name
Optional:
    - region
EOT

  type = map(object({
    application_name = string
    snapshot_name    = string
    region           = optional(string)
  }))
}
