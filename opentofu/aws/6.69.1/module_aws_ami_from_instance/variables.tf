variable "ami_from_instances" {
  description = <<EOT
Map of ami_from_instances, attributes below
Required:
    - name
    - source_instance_id
Optional:
    - deprecation_time
    - description
    - region
    - snapshot_without_reboot
    - tags
    - tags_all
    - ebs_block_device
    - ephemeral_block_device
EOT

  type = map(object({
    name                    = string
    source_instance_id      = string
    deprecation_time        = optional(string)
    description             = optional(string)
    region                  = optional(string)
    snapshot_without_reboot = optional(bool)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    ebs_block_device        = optional(set(object({

        })))
    ephemeral_block_device  = optional(set(object({

        })))
  }))
}
