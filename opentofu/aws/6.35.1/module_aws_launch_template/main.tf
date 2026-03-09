resource "aws_launch_template" "launch_templates" {
  for_each = var.launch_templates

  default_version                      = each.value.default_version
  description                          = each.value.description
  disable_api_stop                     = each.value.disable_api_stop
  disable_api_termination              = each.value.disable_api_termination
  ebs_optimized                        = each.value.ebs_optimized
  image_id                             = each.value.image_id
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  instance_type                        = each.value.instance_type
  kernel_id                            = each.value.kernel_id
  key_name                             = each.value.key_name
  name                                 = each.value.name
  name_prefix                          = each.value.name_prefix
  ram_disk_id                          = each.value.ram_disk_id
  region                               = each.value.region
  security_group_names                 = each.value.security_group_names
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all
  update_default_version               = each.value.update_default_version
  user_data                            = each.value.user_data
  vpc_security_group_ids               = each.value.vpc_security_group_ids

  dynamic "block_device_mappings" {
    for_each = each.value.block_device_mappings != null ? each.value.block_device_mappings : []
    content {
      device_name  = block_device_mappings.value.device_name
      no_device    = block_device_mappings.value.no_device
      virtual_name = block_device_mappings.value.virtual_name

      dynamic "ebs" {
        for_each = block_device_mappings.value.ebs != null ? block_device_mappings.value.ebs : []
        content {
          delete_on_termination      = ebs.value.delete_on_termination
          encrypted                  = ebs.value.encrypted
          iops                       = ebs.value.iops
          kms_key_id                 = ebs.value.kms_key_id
          snapshot_id                = ebs.value.snapshot_id
          throughput                 = ebs.value.throughput
          volume_initialization_rate = ebs.value.volume_initialization_rate
          volume_size                = ebs.value.volume_size
          volume_type                = ebs.value.volume_type
        }
      }
    }
  }

  dynamic "capacity_reservation_specification" {
    for_each = each.value.capacity_reservation_specification != null ? each.value.capacity_reservation_specification : []
    content {
      capacity_reservation_preference = capacity_reservation_specification.value.capacity_reservation_preference

      dynamic "capacity_reservation_target" {
        for_each = capacity_reservation_specification.value.capacity_reservation_target != null ? capacity_reservation_specification.value.capacity_reservation_target : []
        content {
          capacity_reservation_id                 = capacity_reservation_target.value.capacity_reservation_id
          capacity_reservation_resource_group_arn = capacity_reservation_target.value.capacity_reservation_resource_group_arn
        }
      }
    }
  }

  dynamic "cpu_options" {
    for_each = each.value.cpu_options != null ? each.value.cpu_options : []
    content {
      amd_sev_snp           = cpu_options.value.amd_sev_snp
      core_count            = cpu_options.value.core_count
      nested_virtualization = cpu_options.value.nested_virtualization
      threads_per_core      = cpu_options.value.threads_per_core
    }
  }

  dynamic "credit_specification" {
    for_each = each.value.credit_specification != null ? each.value.credit_specification : []
    content {
      cpu_credits = credit_specification.value.cpu_credits
    }
  }

  dynamic "enclave_options" {
    for_each = each.value.enclave_options != null ? each.value.enclave_options : []
    content {
      enabled = enclave_options.value.enabled
    }
  }

  dynamic "hibernation_options" {
    for_each = each.value.hibernation_options != null ? each.value.hibernation_options : []
    content {
      configured = hibernation_options.value.configured
    }
  }

  dynamic "iam_instance_profile" {
    for_each = each.value.iam_instance_profile != null ? each.value.iam_instance_profile : []
    content {
      arn  = iam_instance_profile.value.arn
      name = iam_instance_profile.value.name
    }
  }

  dynamic "instance_market_options" {
    for_each = each.value.instance_market_options != null ? each.value.instance_market_options : []
    content {
      market_type = instance_market_options.value.market_type

      dynamic "spot_options" {
        for_each = instance_market_options.value.spot_options != null ? instance_market_options.value.spot_options : []
        content {
          block_duration_minutes         = spot_options.value.block_duration_minutes
          instance_interruption_behavior = spot_options.value.instance_interruption_behavior
          max_price                      = spot_options.value.max_price
          spot_instance_type             = spot_options.value.spot_instance_type
          valid_until                    = spot_options.value.valid_until
        }
      }
    }
  }

  dynamic "instance_requirements" {
    for_each = each.value.instance_requirements != null ? each.value.instance_requirements : []
    content {
      accelerator_manufacturers                               = instance_requirements.value.accelerator_manufacturers
      accelerator_names                                       = instance_requirements.value.accelerator_names
      accelerator_types                                       = instance_requirements.value.accelerator_types
      allowed_instance_types                                  = instance_requirements.value.allowed_instance_types
      bare_metal                                              = instance_requirements.value.bare_metal
      burstable_performance                                   = instance_requirements.value.burstable_performance
      cpu_manufacturers                                       = instance_requirements.value.cpu_manufacturers
      excluded_instance_types                                 = instance_requirements.value.excluded_instance_types
      instance_generations                                    = instance_requirements.value.instance_generations
      local_storage                                           = instance_requirements.value.local_storage
      local_storage_types                                     = instance_requirements.value.local_storage_types
      max_spot_price_as_percentage_of_optimal_on_demand_price = instance_requirements.value.max_spot_price_as_percentage_of_optimal_on_demand_price
      on_demand_max_price_percentage_over_lowest_price        = instance_requirements.value.on_demand_max_price_percentage_over_lowest_price
      require_hibernate_support                               = instance_requirements.value.require_hibernate_support
      spot_max_price_percentage_over_lowest_price             = instance_requirements.value.spot_max_price_percentage_over_lowest_price

      dynamic "accelerator_count" {
        for_each = instance_requirements.value.accelerator_count != null ? instance_requirements.value.accelerator_count : []
        content {
          max = accelerator_count.value.max
          min = accelerator_count.value.min
        }
      }

      dynamic "accelerator_total_memory_mib" {
        for_each = instance_requirements.value.accelerator_total_memory_mib != null ? instance_requirements.value.accelerator_total_memory_mib : []
        content {
          max = accelerator_total_memory_mib.value.max
          min = accelerator_total_memory_mib.value.min
        }
      }

      dynamic "baseline_ebs_bandwidth_mbps" {
        for_each = instance_requirements.value.baseline_ebs_bandwidth_mbps != null ? instance_requirements.value.baseline_ebs_bandwidth_mbps : []
        content {
          max = baseline_ebs_bandwidth_mbps.value.max
          min = baseline_ebs_bandwidth_mbps.value.min
        }
      }

      dynamic "memory_gib_per_vcpu" {
        for_each = instance_requirements.value.memory_gib_per_vcpu != null ? instance_requirements.value.memory_gib_per_vcpu : []
        content {
          max = memory_gib_per_vcpu.value.max
          min = memory_gib_per_vcpu.value.min
        }
      }

      dynamic "memory_mib" {
        for_each = instance_requirements.value.memory_mib != null ? instance_requirements.value.memory_mib : []
        content {
          min = memory_mib.value.min
          max = memory_mib.value.max
        }
      }

      dynamic "network_bandwidth_gbps" {
        for_each = instance_requirements.value.network_bandwidth_gbps != null ? instance_requirements.value.network_bandwidth_gbps : []
        content {
          max = network_bandwidth_gbps.value.max
          min = network_bandwidth_gbps.value.min
        }
      }

      dynamic "network_interface_count" {
        for_each = instance_requirements.value.network_interface_count != null ? instance_requirements.value.network_interface_count : []
        content {
          max = network_interface_count.value.max
          min = network_interface_count.value.min
        }
      }

      dynamic "total_local_storage_gb" {
        for_each = instance_requirements.value.total_local_storage_gb != null ? instance_requirements.value.total_local_storage_gb : []
        content {
          max = total_local_storage_gb.value.max
          min = total_local_storage_gb.value.min
        }
      }

      dynamic "vcpu_count" {
        for_each = instance_requirements.value.vcpu_count != null ? instance_requirements.value.vcpu_count : []
        content {
          min = vcpu_count.value.min
          max = vcpu_count.value.max
        }
      }
    }
  }

  dynamic "license_specification" {
    for_each = each.value.license_specification != null ? each.value.license_specification : []
    content {
      license_configuration_arn = license_specification.value.license_configuration_arn
    }
  }

  dynamic "maintenance_options" {
    for_each = each.value.maintenance_options != null ? each.value.maintenance_options : []
    content {
      auto_recovery = maintenance_options.value.auto_recovery
    }
  }

  dynamic "metadata_options" {
    for_each = each.value.metadata_options != null ? each.value.metadata_options : []
    content {
      http_endpoint               = metadata_options.value.http_endpoint
      http_protocol_ipv6          = metadata_options.value.http_protocol_ipv6
      http_put_response_hop_limit = metadata_options.value.http_put_response_hop_limit
      http_tokens                 = metadata_options.value.http_tokens
      instance_metadata_tags      = metadata_options.value.instance_metadata_tags
    }
  }

  dynamic "monitoring" {
    for_each = each.value.monitoring != null ? each.value.monitoring : []
    content {
      enabled = monitoring.value.enabled
    }
  }

  dynamic "network_interfaces" {
    for_each = each.value.network_interfaces != null ? each.value.network_interfaces : []
    content {
      associate_carrier_ip_address = network_interfaces.value.associate_carrier_ip_address
      associate_public_ip_address  = network_interfaces.value.associate_public_ip_address
      delete_on_termination        = network_interfaces.value.delete_on_termination
      description                  = network_interfaces.value.description
      device_index                 = network_interfaces.value.device_index
      interface_type               = network_interfaces.value.interface_type
      ipv4_address_count           = network_interfaces.value.ipv4_address_count
      ipv4_addresses               = network_interfaces.value.ipv4_addresses
      ipv4_prefix_count            = network_interfaces.value.ipv4_prefix_count
      ipv4_prefixes                = network_interfaces.value.ipv4_prefixes
      ipv6_address_count           = network_interfaces.value.ipv6_address_count
      ipv6_addresses               = network_interfaces.value.ipv6_addresses
      ipv6_prefix_count            = network_interfaces.value.ipv6_prefix_count
      ipv6_prefixes                = network_interfaces.value.ipv6_prefixes
      network_card_index           = network_interfaces.value.network_card_index
      network_interface_id         = network_interfaces.value.network_interface_id
      primary_ipv6                 = network_interfaces.value.primary_ipv6
      private_ip_address           = network_interfaces.value.private_ip_address
      security_groups              = network_interfaces.value.security_groups
      subnet_id                    = network_interfaces.value.subnet_id

      dynamic "connection_tracking_specification" {
        for_each = network_interfaces.value.connection_tracking_specification != null ? network_interfaces.value.connection_tracking_specification : []
        content {
          tcp_established_timeout = connection_tracking_specification.value.tcp_established_timeout
          udp_stream_timeout      = connection_tracking_specification.value.udp_stream_timeout
          udp_timeout             = connection_tracking_specification.value.udp_timeout
        }
      }

      dynamic "ena_srd_specification" {
        for_each = network_interfaces.value.ena_srd_specification != null ? network_interfaces.value.ena_srd_specification : []
        content {
          ena_srd_enabled = ena_srd_specification.value.ena_srd_enabled

          dynamic "ena_srd_udp_specification" {
            for_each = ena_srd_specification.value.ena_srd_udp_specification != null ? ena_srd_specification.value.ena_srd_udp_specification : []
            content {
              ena_srd_udp_enabled = ena_srd_udp_specification.value.ena_srd_udp_enabled
            }
          }
        }
      }
    }
  }

  dynamic "network_performance_options" {
    for_each = each.value.network_performance_options != null ? each.value.network_performance_options : []
    content {
      bandwidth_weighting = network_performance_options.value.bandwidth_weighting
    }
  }

  dynamic "placement" {
    for_each = each.value.placement != null ? each.value.placement : []
    content {
      affinity                = placement.value.affinity
      availability_zone       = placement.value.availability_zone
      group_id                = placement.value.group_id
      group_name              = placement.value.group_name
      host_id                 = placement.value.host_id
      host_resource_group_arn = placement.value.host_resource_group_arn
      partition_number        = placement.value.partition_number
      spread_domain           = placement.value.spread_domain
      tenancy                 = placement.value.tenancy
    }
  }

  dynamic "private_dns_name_options" {
    for_each = each.value.private_dns_name_options != null ? each.value.private_dns_name_options : []
    content {
      enable_resource_name_dns_a_record    = private_dns_name_options.value.enable_resource_name_dns_a_record
      enable_resource_name_dns_aaaa_record = private_dns_name_options.value.enable_resource_name_dns_aaaa_record
      hostname_type                        = private_dns_name_options.value.hostname_type
    }
  }

  dynamic "secondary_interfaces" {
    for_each = each.value.secondary_interfaces != null ? each.value.secondary_interfaces : []
    content {
      delete_on_termination    = secondary_interfaces.value.delete_on_termination
      device_index             = secondary_interfaces.value.device_index
      interface_type           = secondary_interfaces.value.interface_type
      network_card_index       = secondary_interfaces.value.network_card_index
      private_ip_address_count = secondary_interfaces.value.private_ip_address_count
      private_ip_addresses     = secondary_interfaces.value.private_ip_addresses
      secondary_subnet_id      = secondary_interfaces.value.secondary_subnet_id
    }
  }

  dynamic "tag_specifications" {
    for_each = each.value.tag_specifications != null ? each.value.tag_specifications : []
    content {
      resource_type = tag_specifications.value.resource_type
      tags          = tag_specifications.value.tags
    }
  }
}
