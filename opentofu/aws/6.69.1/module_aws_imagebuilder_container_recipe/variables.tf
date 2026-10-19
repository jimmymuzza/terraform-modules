variable "imagebuilder_container_recipes" {
  description = <<EOT
Map of imagebuilder_container_recipes, attributes below
Required:
    - container_type
    - name
    - parent_image
    - version
    - component
    - target_repository
Optional:
    - description
    - dockerfile_template_data
    - dockerfile_template_uri
    - kms_key_id
    - platform_override
    - region
    - tags
    - tags_all
    - working_directory
    - instance_configuration
EOT

  type = map(object({
    container_type           = string
    name                     = string
    parent_image             = string
    version                  = string
    description              = optional(string)
    dockerfile_template_data = optional(string)
    dockerfile_template_uri  = optional(string)
    kms_key_id               = optional(string)
    platform_override        = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    working_directory        = optional(string)
    component                = list(object({
            component_arn = string
            parameter     = optional(set(object({
                name  = string
                value = string
            })))
        }))
    instance_configuration   = optional(list(object({
            image                = optional(string)
            block_device_mapping = optional(set(object({
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
        })))
    target_repository        = list(object({
            repository_name = string
            service         = string
        }))
  }))
}
