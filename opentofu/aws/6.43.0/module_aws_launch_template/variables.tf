variable "launch_templates" {
  description = <<EOT
Map of launch_templates, attributes below
Optional:
    - default_version
    - description
    - disable_api_stop
    - disable_api_termination
    - ebs_optimized
    - image_id
    - instance_initiated_shutdown_behavior
    - instance_type
    - kernel_id
    - key_name
    - name
    - name_prefix
    - ram_disk_id
    - region
    - security_group_names
    - tags
    - tags_all
    - update_default_version
    - user_data
    - vpc_security_group_ids
    - block_device_mappings
    - capacity_reservation_specification
    - cpu_options
    - credit_specification
    - enclave_options
    - hibernation_options
    - iam_instance_profile
    - instance_market_options
    - instance_requirements
    - license_specification
    - maintenance_options
    - metadata_options
    - monitoring
    - network_interfaces
    - network_performance_options
    - placement
    - private_dns_name_options
    - secondary_interfaces
    - tag_specifications
EOT

  type = map(object({
    default_version                      = optional(number)
    description                          = optional(string)
    disable_api_stop                     = optional(bool)
    disable_api_termination              = optional(bool)
    ebs_optimized                        = optional(string)
    image_id                             = optional(string)
    instance_initiated_shutdown_behavior = optional(string)
    instance_type                        = optional(string)
    kernel_id                            = optional(string)
    key_name                             = optional(string)
    name                                 = optional(string)
    name_prefix                          = optional(string)
    ram_disk_id                          = optional(string)
    region                               = optional(string)
    security_group_names                 = optional(set(string))
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    update_default_version               = optional(bool)
    user_data                            = optional(string)
    vpc_security_group_ids               = optional(set(string))
    block_device_mappings                = optional(list(object({
            device_name  = optional(string)
            no_device    = optional(string)
            virtual_name = optional(string)
            ebs          = optional(list(object({
                delete_on_termination      = optional(string)
                encrypted                  = optional(string)
                iops                       = optional(number)
                kms_key_id                 = optional(string)
                snapshot_id                = optional(string)
                throughput                 = optional(number)
                volume_initialization_rate = optional(number)
                volume_size                = optional(number)
                volume_type                = optional(string)
            })))
        })))
    capacity_reservation_specification   = optional(list(object({
            capacity_reservation_preference = optional(string)
            capacity_reservation_target     = optional(list(object({
                capacity_reservation_id                 = optional(string)
                capacity_reservation_resource_group_arn = optional(string)
            })))
        })))
    cpu_options                          = optional(list(object({
            amd_sev_snp           = optional(string)
            core_count            = optional(number)
            nested_virtualization = optional(string)
            threads_per_core      = optional(number)
        })))
    credit_specification                 = optional(list(object({
            cpu_credits = optional(string)
        })))
    enclave_options                      = optional(list(object({
            enabled = optional(bool)
        })))
    hibernation_options                  = optional(list(object({
            configured = bool
        })))
    iam_instance_profile                 = optional(list(object({
            arn  = optional(string)
            name = optional(string)
        })))
    instance_market_options              = optional(list(object({
            market_type  = optional(string)
            spot_options = optional(list(object({
                block_duration_minutes         = optional(number)
                instance_interruption_behavior = optional(string)
                max_price                      = optional(string)
                spot_instance_type             = optional(string)
                valid_until                    = optional(string)
            })))
        })))
    instance_requirements                = optional(list(object({
            accelerator_manufacturers                               = optional(set(string))
            accelerator_names                                       = optional(set(string))
            accelerator_types                                       = optional(set(string))
            allowed_instance_types                                  = optional(set(string))
            bare_metal                                              = optional(string)
            burstable_performance                                   = optional(string)
            cpu_manufacturers                                       = optional(set(string))
            excluded_instance_types                                 = optional(set(string))
            instance_generations                                    = optional(set(string))
            local_storage                                           = optional(string)
            local_storage_types                                     = optional(set(string))
            max_spot_price_as_percentage_of_optimal_on_demand_price = optional(number)
            on_demand_max_price_percentage_over_lowest_price        = optional(number)
            require_hibernate_support                               = optional(bool)
            spot_max_price_percentage_over_lowest_price             = optional(number)
            accelerator_count                                       = optional(list(object({
                max = optional(number)
                min = optional(number)
            })))
            accelerator_total_memory_mib                            = optional(list(object({
                max = optional(number)
                min = optional(number)
            })))
            baseline_ebs_bandwidth_mbps                             = optional(list(object({
                max = optional(number)
                min = optional(number)
            })))
            memory_gib_per_vcpu                                     = optional(list(object({
                max = optional(number)
                min = optional(number)
            })))
            memory_mib                                              = list(object({
                min = number
                max = optional(number)
            }))
            network_bandwidth_gbps                                  = optional(list(object({
                max = optional(number)
                min = optional(number)
            })))
            network_interface_count                                 = optional(list(object({
                max = optional(number)
                min = optional(number)
            })))
            total_local_storage_gb                                  = optional(list(object({
                max = optional(number)
                min = optional(number)
            })))
            vcpu_count                                              = list(object({
                min = number
                max = optional(number)
            }))
        })))
    license_specification                = optional(set(object({
            license_configuration_arn = string
        })))
    maintenance_options                  = optional(list(object({
            auto_recovery = optional(string)
        })))
    metadata_options                     = optional(list(object({
            http_endpoint               = optional(string)
            http_protocol_ipv6          = optional(string)
            http_put_response_hop_limit = optional(number)
            http_tokens                 = optional(string)
            instance_metadata_tags      = optional(string)
        })))
    monitoring                           = optional(list(object({
            enabled = optional(bool)
        })))
    network_interfaces                   = optional(list(object({
            associate_carrier_ip_address      = optional(string)
            associate_public_ip_address       = optional(string)
            delete_on_termination             = optional(string)
            description                       = optional(string)
            device_index                      = optional(number)
            interface_type                    = optional(string)
            ipv4_address_count                = optional(number)
            ipv4_addresses                    = optional(set(string))
            ipv4_prefix_count                 = optional(number)
            ipv4_prefixes                     = optional(set(string))
            ipv6_address_count                = optional(number)
            ipv6_addresses                    = optional(set(string))
            ipv6_prefix_count                 = optional(number)
            ipv6_prefixes                     = optional(set(string))
            network_card_index                = optional(number)
            network_interface_id              = optional(string)
            primary_ipv6                      = optional(string)
            private_ip_address                = optional(string)
            security_groups                   = optional(set(string))
            subnet_id                         = optional(string)
            connection_tracking_specification = optional(list(object({
                tcp_established_timeout = optional(number)
                udp_stream_timeout      = optional(number)
                udp_timeout             = optional(number)
            })))
            ena_srd_specification             = optional(list(object({
                ena_srd_enabled           = optional(bool)
                ena_srd_udp_specification = optional(list(object({
                    ena_srd_udp_enabled = optional(bool)
                })))
            })))
        })))
    network_performance_options          = optional(list(object({
            bandwidth_weighting = optional(string)
        })))
    placement                            = optional(list(object({
            affinity                = optional(string)
            availability_zone       = optional(string)
            group_id                = optional(string)
            group_name              = optional(string)
            host_id                 = optional(string)
            host_resource_group_arn = optional(string)
            partition_number        = optional(number)
            spread_domain           = optional(string)
            tenancy                 = optional(string)
        })))
    private_dns_name_options             = optional(list(object({
            enable_resource_name_dns_a_record    = optional(bool)
            enable_resource_name_dns_aaaa_record = optional(bool)
            hostname_type                        = optional(string)
        })))
    secondary_interfaces                 = optional(list(object({
            delete_on_termination    = optional(bool)
            device_index             = optional(number)
            interface_type           = optional(string)
            network_card_index       = optional(number)
            private_ip_address_count = optional(number)
            private_ip_addresses     = optional(set(string))
            secondary_subnet_id      = optional(string)
        })))
    tag_specifications                   = optional(list(object({
            resource_type = optional(string)
            tags          = optional(map(string))
        })))
  }))
}
