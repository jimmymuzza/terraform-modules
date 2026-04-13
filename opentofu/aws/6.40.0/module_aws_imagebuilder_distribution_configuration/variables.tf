variable "imagebuilder_distribution_configurations" {
  description = <<EOT
Map of imagebuilder_distribution_configurations, attributes below
Required:
    - name
    - distribution
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name         = string
    description  = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    distribution = set(object({
            region                               = string
            license_configuration_arns           = optional(set(string))
            ami_distribution_configuration       = optional(list(object({
                ami_tags           = optional(map(string))
                description        = optional(string)
                kms_key_id         = optional(string)
                name               = optional(string)
                target_account_ids = optional(set(string))
                launch_permission  = optional(list(object({
                    organization_arns        = optional(set(string))
                    organizational_unit_arns = optional(set(string))
                    user_groups              = optional(set(string))
                    user_ids                 = optional(set(string))
                })))
            })))
            container_distribution_configuration = optional(list(object({
                container_tags    = optional(set(string))
                description       = optional(string)
                target_repository = list(object({
                    repository_name = string
                    service         = string
                }))
            })))
            fast_launch_configuration            = optional(set(object({
                account_id             = string
                enabled                = bool
                max_parallel_launches  = optional(number)
                launch_template        = optional(list(object({
                    launch_template_id      = optional(string)
                    launch_template_name    = optional(string)
                    launch_template_version = optional(string)
                })))
                snapshot_configuration = optional(list(object({
                    target_resource_count = optional(number)
                })))
            })))
            launch_template_configuration        = optional(set(object({
                launch_template_id = string
                account_id         = optional(string)
                default            = optional(bool)
            })))
            s3_export_configuration              = optional(list(object({
                disk_image_format = string
                role_name         = string
                s3_bucket         = string
                s3_prefix         = optional(string)
            })))
            ssm_parameter_configuration          = optional(set(object({
                parameter_name = string
                ami_account_id = optional(string)
                data_type      = optional(string)
            })))
        }))
  }))
}
