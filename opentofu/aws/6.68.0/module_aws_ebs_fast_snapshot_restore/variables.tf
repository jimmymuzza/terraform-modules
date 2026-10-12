variable "ebs_fast_snapshot_restores" {
  description = <<EOT
Map of ebs_fast_snapshot_restores, attributes below
Required:
    - availability_zone
    - snapshot_id
Optional:
    - region
EOT

  type = map(object({
    availability_zone = string
    snapshot_id       = string
    region            = optional(string)
  }))
}
