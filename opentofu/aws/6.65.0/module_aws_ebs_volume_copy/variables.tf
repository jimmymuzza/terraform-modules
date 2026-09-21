variable "ebs_volume_copies" {
  description = <<EOT
Map of ebs_volume_copies, attributes below
Required:
    - source_volume_id
Optional:
    - iops
    - region
    - size
    - tags
    - throughput
    - volume_type
EOT

  type = map(object({
    source_volume_id = string
    iops             = optional(number)
    region           = optional(string)
    size             = optional(number)
    tags             = optional(map(string))
    throughput       = optional(number)
    volume_type      = optional(string)
  }))
}
