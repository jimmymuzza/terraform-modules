variable "lambda_capacity_providers" {
  description = <<EOT
Map of lambda_capacity_providers, attributes below
Required:
    - name
Optional:
    - capacity_provider_scaling_config
    - instance_requirements
    - kms_key_arn
    - region
    - tags
    - permissions_config
    - vpc_config
EOT

  type = map(object({
    name                             = string
    capacity_provider_scaling_config = optional(list(object({
            max_vcpu_count = number
            scaling_mode = string
            scaling_policies = list(object({
                predefined_metric_type = string
                target_value = number
            }))
        })))
    instance_requirements            = optional(list(object({
            allowed_instance_types = list(string)
            architectures = list(string)
            excluded_instance_types = list(string)
        })))
    kms_key_arn                      = optional(string)
    region                           = optional(string)
    tags                             = optional(map(string))
    permissions_config               = optional(list(object({
            capacity_provider_operator_role_arn = string
        })))
    vpc_config                       = optional(list(object({
            security_group_ids = set(string)
            subnet_ids         = set(string)
        })))
  }))
}
