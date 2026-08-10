variable "imagebuilder_image_recipes" {
  description = <<EOT
Map of imagebuilder_image_recipes, attributes below
Required:
    - name
    - parent_image
    - version
    - component
Optional:
    - ami_tags
    - description
    - region
    - tags
    - tags_all
    - user_data_base64
    - working_directory
    - block_device_mapping
    - systems_manager_agent
EOT

  type = map(object({
    name                  = string
    parent_image          = string
    version               = string
    ami_tags              = optional(map(string))
    description           = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    user_data_base64      = optional(string)
    working_directory     = optional(string)
    block_device_mapping  = optional(set(object({
            device_name  = optional(string)
            no_device    = optional(bool)
            virtual_name = optional(string)
            ebs          = optional(list(object({
                delete_on_termination = optional(string)
                encrypted             = optional(string)
                iops                  = optional(number)
                kms_key_id            = optional(string)
                snapshot_id           = optional(string)
                throughput            = optional(number)
                volume_size           = optional(number)
                volume_type           = optional(string)
            })))
        })))
    component             = list(object({
            component_arn = string
            parameter     = optional(set(object({
                name  = string
                value = string
            })))
        }))
    systems_manager_agent = optional(list(object({
            uninstall_after_build = bool
        })))
  }))
}
