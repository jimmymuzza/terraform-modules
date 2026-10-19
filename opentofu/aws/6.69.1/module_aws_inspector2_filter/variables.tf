variable "inspector2_filters" {
  description = <<EOT
Map of inspector2_filters, attributes below
Required:
    - action
    - name
Optional:
    - description
    - reason
    - region
    - tags
    - filter_criteria
EOT

  type = map(object({
    action          = string
    name            = string
    description     = optional(string)
    reason          = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    filter_criteria = optional(list(object({
            aws_account_id                     = optional(set(object({
                comparison = string
                value      = string
            })))
            code_repository_project_name       = optional(set(object({
                comparison = string
                value      = string
            })))
            code_repository_provider_type      = optional(set(object({
                comparison = string
                value      = string
            })))
            code_vulnerability_detector_name   = optional(set(object({
                comparison = string
                value      = string
            })))
            code_vulnerability_detector_tags   = optional(set(object({
                comparison = string
                value      = string
            })))
            code_vulnerability_file_path       = optional(set(object({
                comparison = string
                value      = string
            })))
            component_id                       = optional(set(object({
                comparison = string
                value      = string
            })))
            component_type                     = optional(set(object({
                comparison = string
                value      = string
            })))
            ec2_instance_image_id              = optional(set(object({
                comparison = string
                value      = string
            })))
            ec2_instance_subnet_id             = optional(set(object({
                comparison = string
                value      = string
            })))
            ec2_instance_vpc_id                = optional(set(object({
                comparison = string
                value      = string
            })))
            ecr_image_architecture             = optional(set(object({
                comparison = string
                value      = string
            })))
            ecr_image_hash                     = optional(set(object({
                comparison = string
                value      = string
            })))
            ecr_image_in_use_count             = optional(set(object({
                lower_inclusive = number
                upper_inclusive = number
            })))
            ecr_image_last_in_use_at           = optional(set(object({
                end_inclusive   = optional(string)
                start_inclusive = optional(string)
            })))
            ecr_image_pushed_at                = optional(set(object({
                end_inclusive   = optional(string)
                start_inclusive = optional(string)
            })))
            ecr_image_registry                 = optional(set(object({
                comparison = string
                value      = string
            })))
            ecr_image_repository_name          = optional(set(object({
                comparison = string
                value      = string
            })))
            ecr_image_tags                     = optional(set(object({
                comparison = string
                value      = string
            })))
            epss_score                         = optional(set(object({
                lower_inclusive = number
                upper_inclusive = number
            })))
            exploit_available                  = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_arn                        = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_status                     = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_type                       = optional(set(object({
                comparison = string
                value      = string
            })))
            first_observed_at                  = optional(set(object({
                end_inclusive   = optional(string)
                start_inclusive = optional(string)
            })))
            fix_available                      = optional(set(object({
                comparison = string
                value      = string
            })))
            inspector_score                    = optional(set(object({
                lower_inclusive = number
                upper_inclusive = number
            })))
            lambda_function_execution_role_arn = optional(set(object({
                comparison = string
                value      = string
            })))
            lambda_function_last_modified_at   = optional(set(object({
                end_inclusive   = optional(string)
                start_inclusive = optional(string)
            })))
            lambda_function_layers             = optional(set(object({
                comparison = string
                value      = string
            })))
            lambda_function_name               = optional(set(object({
                comparison = string
                value      = string
            })))
            lambda_function_runtime            = optional(set(object({
                comparison = string
                value      = string
            })))
            last_observed_at                   = optional(set(object({
                end_inclusive   = optional(string)
                start_inclusive = optional(string)
            })))
            network_protocol                   = optional(set(object({
                comparison = string
                value      = string
            })))
            port_range                         = optional(set(object({
                begin_inclusive = number
                end_inclusive   = number
            })))
            related_vulnerabilities            = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_id                        = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_tags                      = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            resource_type                      = optional(set(object({
                comparison = string
                value      = string
            })))
            severity                           = optional(set(object({
                comparison = string
                value      = string
            })))
            title                              = optional(set(object({
                comparison = string
                value      = string
            })))
            updated_at                         = optional(set(object({
                end_inclusive   = optional(string)
                start_inclusive = optional(string)
            })))
            vendor_severity                    = optional(set(object({
                comparison = string
                value      = string
            })))
            vulnerability_id                   = optional(set(object({
                comparison = string
                value      = string
            })))
            vulnerability_source               = optional(set(object({
                comparison = string
                value      = string
            })))
            vulnerable_packages                = optional(set(object({
                architecture            = optional(list(object({
                    comparison = string
                    value      = string
                })))
                epoch                   = optional(list(object({
                    lower_inclusive = number
                    upper_inclusive = number
                })))
                file_path               = optional(list(object({
                    comparison = string
                    value      = string
                })))
                name                    = optional(list(object({
                    comparison = string
                    value      = string
                })))
                release                 = optional(list(object({
                    comparison = string
                    value      = string
                })))
                source_lambda_layer_arn = optional(list(object({
                    comparison = string
                    value      = string
                })))
                source_layer_hash       = optional(list(object({
                    comparison = string
                    value      = string
                })))
                version                 = optional(list(object({
                    comparison = string
                    value      = string
                })))
            })))
        })))
  }))
}
