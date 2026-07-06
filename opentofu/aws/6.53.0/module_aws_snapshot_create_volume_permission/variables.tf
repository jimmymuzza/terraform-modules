variable "snapshot_create_volume_permissions" {
  description = <<EOT
Map of snapshot_create_volume_permissions, attributes below
Required:
    - account_id
    - snapshot_id
Optional:
    - region
EOT

  type = map(object({
    account_id  = string
    snapshot_id = string
    region      = optional(string)
  }))
}
