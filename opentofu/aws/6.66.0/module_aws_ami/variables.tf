variable "amis" {
  description = <<EOT
Map of amis, attributes below
Required:
    - name
Optional:
    - architecture
    - boot_mode
    - deprecation_time
    - description
    - ena_support
    - image_location
    - imds_support
    - kernel_id
    - ramdisk_id
    - region
    - root_device_name
    - sriov_net_support
    - tags
    - tags_all
    - tpm_support
    - uefi_data
    - virtualization_type
    - ebs_block_device
    - ephemeral_block_device
EOT

  type = map(object({
    name                   = string
    architecture           = optional(string)
    boot_mode              = optional(string)
    deprecation_time       = optional(string)
    description            = optional(string)
    ena_support            = optional(bool)
    image_location         = optional(string)
    imds_support           = optional(string)
    kernel_id              = optional(string)
    ramdisk_id             = optional(string)
    region                 = optional(string)
    root_device_name       = optional(string)
    sriov_net_support      = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    tpm_support            = optional(string)
    uefi_data              = optional(string)
    virtualization_type    = optional(string)
    ebs_block_device       = optional(set(object({
            device_name           = string
            delete_on_termination = optional(bool)
            encrypted             = optional(bool)
            iops                  = optional(number)
            outpost_arn           = optional(string)
            snapshot_id           = optional(string)
            throughput            = optional(number)
            volume_size           = optional(number)
            volume_type           = optional(string)
        })))
    ephemeral_block_device = optional(set(object({
            device_name  = string
            virtual_name = string
        })))
  }))
}
