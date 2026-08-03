variable "ebs_volumes" {
  description = <<EOT
Map of ebs_volumes, attributes below
Required:
    - availability_zone
Optional:
    - encrypted
    - final_snapshot
    - iops
    - kms_key_id
    - multi_attach_enabled
    - outpost_arn
    - region
    - size
    - snapshot_id
    - tags
    - tags_all
    - throughput
    - type
    - volume_initialization_rate
EOT

  type = map(object({
    availability_zone          = string
    encrypted                  = optional(bool)
    final_snapshot             = optional(bool)
    iops                       = optional(number)
    kms_key_id                 = optional(string)
    multi_attach_enabled       = optional(bool)
    outpost_arn                = optional(string)
    region                     = optional(string)
    size                       = optional(number)
    snapshot_id                = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    throughput                 = optional(number)
    type                       = optional(string)
    volume_initialization_rate = optional(number)
  }))
}
