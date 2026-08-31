variable "storagegateway_stored_iscsi_volumes" {
  description = <<EOT
Map of storagegateway_stored_iscsi_volumes, attributes below
Required:
    - disk_id
    - gateway_arn
    - network_interface_id
    - preserve_existing_data
    - target_name
Optional:
    - kms_encrypted
    - kms_key
    - region
    - snapshot_id
    - tags
    - tags_all
EOT

  type = map(object({
    disk_id                = string
    gateway_arn            = string
    network_interface_id   = string
    preserve_existing_data = bool
    target_name            = string
    kms_encrypted          = optional(bool)
    kms_key                = optional(string)
    region                 = optional(string)
    snapshot_id            = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
  }))
}
