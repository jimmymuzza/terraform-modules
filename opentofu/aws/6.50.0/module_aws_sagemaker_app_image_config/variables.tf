variable "sagemaker_app_image_configs" {
  description = <<EOT
Map of sagemaker_app_image_configs, attributes below
Required:
    - app_image_config_name
Optional:
    - region
    - tags
    - tags_all
    - code_editor_app_image_config
    - jupyter_lab_image_config
    - kernel_gateway_image_config
EOT

  type = map(object({
    app_image_config_name        = string
    region                       = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    code_editor_app_image_config = optional(list(object({
            container_config   = optional(list(object({
                container_arguments             = optional(list(string))
                container_entrypoint            = optional(list(string))
                container_environment_variables = optional(map(string))
            })))
            file_system_config = optional(list(object({
                default_gid = optional(number)
                default_uid = optional(number)
                mount_path  = optional(string)
            })))
        })))
    jupyter_lab_image_config     = optional(list(object({
            container_config   = optional(list(object({
                container_arguments             = optional(list(string))
                container_entrypoint            = optional(list(string))
                container_environment_variables = optional(map(string))
            })))
            file_system_config = optional(list(object({
                default_gid = optional(number)
                default_uid = optional(number)
                mount_path  = optional(string)
            })))
        })))
    kernel_gateway_image_config  = optional(list(object({
            file_system_config = optional(list(object({
                default_gid = optional(number)
                default_uid = optional(number)
                mount_path  = optional(string)
            })))
            kernel_spec        = list(object({
                name         = string
                display_name = optional(string)
            }))
        })))
  }))
}
