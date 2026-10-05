variable "sagemaker_notebook_instances" {
  description = <<EOT
Map of sagemaker_notebook_instances, attributes below
Required:
    - instance_type
    - name
    - role_arn
Optional:
    - additional_code_repositories
    - default_code_repository
    - direct_internet_access
    - kms_key_id
    - lifecycle_config_name
    - platform_identifier
    - region
    - root_access
    - security_groups
    - subnet_id
    - tags
    - tags_all
    - volume_size
    - instance_metadata_service_configuration
EOT

  type = map(object({
    instance_type                           = string
    name                                    = string
    role_arn                                = string
    additional_code_repositories            = optional(set(string))
    default_code_repository                 = optional(string)
    direct_internet_access                  = optional(string)
    kms_key_id                              = optional(string)
    lifecycle_config_name                   = optional(string)
    platform_identifier                     = optional(string)
    region                                  = optional(string)
    root_access                             = optional(string)
    security_groups                         = optional(set(string))
    subnet_id                               = optional(string)
    tags                                    = optional(map(string))
    tags_all                                = optional(map(string))
    volume_size                             = optional(number)
    instance_metadata_service_configuration = optional(list(object({
            minimum_instance_metadata_service_version = optional(string)
        })))
  }))
}
