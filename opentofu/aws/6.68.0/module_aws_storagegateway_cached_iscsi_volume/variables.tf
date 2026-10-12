variable "storagegateway_cached_iscsi_volumes" {
  description = <<EOT
Map of storagegateway_cached_iscsi_volumes, attributes below
Required:
    - gateway_arn
    - network_interface_id
    - target_name
    - volume_size_in_bytes
Optional:
    - kms_encrypted
    - kms_key
    - region
    - snapshot_id
    - source_volume_arn
    - tags
    - tags_all
EOT

  type = map(object({
    gateway_arn          = string
    network_interface_id = string
    target_name          = string
    volume_size_in_bytes = number
    kms_encrypted        = optional(bool)
    kms_key              = optional(string)
    region               = optional(string)
    snapshot_id          = optional(string)
    source_volume_arn    = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
