variable "launch_configurations" {
  description = <<EOT
Map of launch_configurations, attributes below
Required:
    - image_id
    - instance_type
Optional:
    - associate_public_ip_address
    - ebs_optimized
    - enable_monitoring
    - iam_instance_profile
    - key_name
    - name
    - name_prefix
    - placement_tenancy
    - region
    - security_groups
    - spot_price
    - user_data
    - user_data_base64
    - ebs_block_device
    - ephemeral_block_device
    - metadata_options
    - root_block_device
EOT

  type = map(object({
    image_id                    = string
    instance_type               = string
    associate_public_ip_address = optional(bool)
    ebs_optimized               = optional(bool)
    enable_monitoring           = optional(bool)
    iam_instance_profile        = optional(string)
    key_name                    = optional(string)
    name                        = optional(string)
    name_prefix                 = optional(string)
    placement_tenancy           = optional(string)
    region                      = optional(string)
    security_groups             = optional(set(string))
    spot_price                  = optional(string)
    user_data                   = optional(string)
    user_data_base64            = optional(string)
    ebs_block_device            = optional(set(object({
            device_name           = string
            delete_on_termination = optional(bool)
            encrypted             = optional(bool)
            iops                  = optional(number)
            no_device             = optional(bool)
            snapshot_id           = optional(string)
            throughput            = optional(number)
            volume_size           = optional(number)
            volume_type           = optional(string)
        })))
    ephemeral_block_device      = optional(set(object({
            device_name  = string
            no_device    = optional(bool)
            virtual_name = optional(string)
        })))
    metadata_options            = optional(list(object({
            http_endpoint               = optional(string)
            http_put_response_hop_limit = optional(number)
            http_tokens                 = optional(string)
        })))
    root_block_device           = optional(list(object({
            delete_on_termination = optional(bool)
            encrypted             = optional(bool)
            iops                  = optional(number)
            throughput            = optional(number)
            volume_size           = optional(number)
            volume_type           = optional(string)
        })))
  }))
}
