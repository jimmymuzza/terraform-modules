variable "securityhub_insights" {
  description = <<EOT
Map of securityhub_insights, attributes below
Required:
    - group_by_attribute
    - name
    - filters
Optional:
    - region
EOT

  type = map(object({
    group_by_attribute = string
    name               = string
    region             = optional(string)
    filters            = list(object({
            aws_account_id                                       = optional(set(object({
                comparison = string
                value      = string
            })))
            aws_account_name                                     = optional(set(object({
                comparison = string
                value      = string
            })))
            company_name                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_associated_standards_id                   = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_security_control_id                       = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_security_control_parameters_name          = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_security_control_parameters_value         = optional(set(object({
                comparison = string
                value      = string
            })))
            compliance_status                                    = optional(set(object({
                comparison = string
                value      = string
            })))
            confidence                                           = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            created_at                                           = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            criticality                                          = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            description                                          = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_provider_fields_confidence                   = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            finding_provider_fields_criticality                  = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            finding_provider_fields_related_findings_id          = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_provider_fields_related_findings_product_arn = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_provider_fields_severity_label               = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_provider_fields_severity_original            = optional(set(object({
                comparison = string
                value      = string
            })))
            finding_provider_fields_types                        = optional(set(object({
                comparison = string
                value      = string
            })))
            first_observed_at                                    = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            generator_id                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            id                                                   = optional(set(object({
                comparison = string
                value      = string
            })))
            keyword                                              = optional(set(object({
                value = string
            })))
            last_observed_at                                     = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            malware_name                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            malware_path                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            malware_state                                        = optional(set(object({
                comparison = string
                value      = string
            })))
            malware_type                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            network_destination_domain                           = optional(set(object({
                comparison = string
                value      = string
            })))
            network_destination_ipv4                             = optional(set(object({
                cidr = string
            })))
            network_destination_ipv6                             = optional(set(object({
                cidr = string
            })))
            network_destination_port                             = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            network_direction                                    = optional(set(object({
                comparison = string
                value      = string
            })))
            network_protocol                                     = optional(set(object({
                comparison = string
                value      = string
            })))
            network_source_domain                                = optional(set(object({
                comparison = string
                value      = string
            })))
            network_source_ipv4                                  = optional(set(object({
                cidr = string
            })))
            network_source_ipv6                                  = optional(set(object({
                cidr = string
            })))
            network_source_mac                                   = optional(set(object({
                comparison = string
                value      = string
            })))
            network_source_port                                  = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            note_text                                            = optional(set(object({
                comparison = string
                value      = string
            })))
            note_updated_at                                      = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            note_updated_by                                      = optional(set(object({
                comparison = string
                value      = string
            })))
            process_launched_at                                  = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            process_name                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            process_parent_pid                                   = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            process_path                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            process_pid                                          = optional(set(object({
                eq  = optional(string)
                gte = optional(string)
                lte = optional(string)
            })))
            process_terminated_at                                = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            product_arn                                          = optional(set(object({
                comparison = string
                value      = string
            })))
            product_fields                                       = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            product_name                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            recommendation_text                                  = optional(set(object({
                comparison = string
                value      = string
            })))
            record_state                                         = optional(set(object({
                comparison = string
                value      = string
            })))
            related_findings_id                                  = optional(set(object({
                comparison = string
                value      = string
            })))
            related_findings_product_arn                         = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_ec2_instance_iam_instance_profile_arn   = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_ec2_instance_image_id                   = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_ec2_instance_ipv4_addresses             = optional(set(object({
                cidr = string
            })))
            resource_aws_ec2_instance_ipv6_addresses             = optional(set(object({
                cidr = string
            })))
            resource_aws_ec2_instance_key_name                   = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_ec2_instance_launched_at                = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            resource_aws_ec2_instance_subnet_id                  = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_ec2_instance_type                       = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_ec2_instance_vpc_id                     = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_iam_access_key_created_at               = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            resource_aws_iam_access_key_status                   = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_iam_access_key_user_name                = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_s3_bucket_owner_id                      = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_aws_s3_bucket_owner_name                    = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_container_image_id                          = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_container_image_name                        = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_container_launched_at                       = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            resource_container_name                              = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_details_other                               = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            resource_id                                          = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_partition                                   = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_region                                      = optional(set(object({
                comparison = string
                value      = string
            })))
            resource_tags                                        = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            resource_type                                        = optional(set(object({
                comparison = string
                value      = string
            })))
            severity_label                                       = optional(set(object({
                comparison = string
                value      = string
            })))
            source_url                                           = optional(set(object({
                comparison = string
                value      = string
            })))
            threat_intel_indicator_category                      = optional(set(object({
                comparison = string
                value      = string
            })))
            threat_intel_indicator_last_observed_at              = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            threat_intel_indicator_source                        = optional(set(object({
                comparison = string
                value      = string
            })))
            threat_intel_indicator_source_url                    = optional(set(object({
                comparison = string
                value      = string
            })))
            threat_intel_indicator_type                          = optional(set(object({
                comparison = string
                value      = string
            })))
            threat_intel_indicator_value                         = optional(set(object({
                comparison = string
                value      = string
            })))
            title                                                = optional(set(object({
                comparison = string
                value      = string
            })))
            type                                                 = optional(set(object({
                comparison = string
                value      = string
            })))
            updated_at                                           = optional(set(object({
                end        = optional(string)
                start      = optional(string)
                date_range = optional(list(object({
                    unit  = string
                    value = number
                })))
            })))
            user_defined_values                                  = optional(set(object({
                comparison = string
                key        = string
                value      = string
            })))
            verification_state                                   = optional(set(object({
                comparison = string
                value      = string
            })))
            workflow_status                                      = optional(set(object({
                comparison = string
                value      = string
            })))
        }))
  }))
}
