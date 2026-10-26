variable "fsx_openzfs_snapshots" {
  description = <<EOT
Map of fsx_openzfs_snapshots, attributes below
Required:
    - name
    - volume_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name      = string
    volume_id = string
    region    = optional(string)
    tags      = optional(map(string))
    tags_all  = optional(map(string))
  }))
}
