resource "aws_instance" "instances" {
  for_each = var.instances

  ami                                  = each.value.ami
  associate_public_ip_address          = each.value.associate_public_ip_address
  availability_zone                    = each.value.availability_zone
  disable_api_stop                     = each.value.disable_api_stop
  disable_api_termination              = each.value.disable_api_termination
  ebs_optimized                        = each.value.ebs_optimized
  enable_primary_ipv6                  = each.value.enable_primary_ipv6
  force_destroy                        = each.value.force_destroy
  get_password_data                    = each.value.get_password_data
  hibernation                          = each.value.hibernation
  host_id                              = each.value.host_id
  host_resource_group_arn              = each.value.host_resource_group_arn
  iam_instance_profile                 = each.value.iam_instance_profile
  instance_initiated_shutdown_behavior = each.value.instance_initiated_shutdown_behavior
  instance_type                        = each.value.instance_type
  ipv6_address_count                   = each.value.ipv6_address_count
  ipv6_addresses                       = each.value.ipv6_addresses
  key_name                             = each.value.key_name
  monitoring                           = each.value.monitoring
  placement_group                      = each.value.placement_group
  placement_group_id                   = each.value.placement_group_id
  placement_partition_number           = each.value.placement_partition_number
  private_ip                           = each.value.private_ip
  region                               = each.value.region
  secondary_private_ips                = each.value.secondary_private_ips
  security_groups                      = each.value.security_groups
  source_dest_check                    = each.value.source_dest_check
  subnet_id                            = each.value.subnet_id
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all
  tenancy                              = each.value.tenancy
  user_data                            = each.value.user_data
  user_data_base64                     = each.value.user_data_base64
  user_data_replace_on_change          = each.value.user_data_replace_on_change
  volume_tags                          = each.value.volume_tags
  vpc_security_group_ids               = each.value.vpc_security_group_ids

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

  dynamic "ebs_block_device" {
    for_each = each.value.ebs_block_device != null ? each.value.ebs_block_device : []
    content {
      device_name           = ebs_block_device.value.device_name
      delete_on_termination = ebs_block_device.value.delete_on_termination
      encrypted             = ebs_block_device.value.encrypted
      iops                  = ebs_block_device.value.iops
      kms_key_id            = ebs_block_device.value.kms_key_id
      snapshot_id           = ebs_block_device.value.snapshot_id
      tags                  = ebs_block_device.value.tags
      tags_all              = ebs_block_device.value.tags_all
      throughput            = ebs_block_device.value.throughput
      volume_size           = ebs_block_device.value.volume_size
      volume_type           = ebs_block_device.value.volume_type
    }
  }

  dynamic "enclave_options" {
    for_each = each.value.enclave_options != null ? each.value.enclave_options : []
    content {
      enabled = enclave_options.value.enabled
    }
  }

  dynamic "ephemeral_block_device" {
    for_each = each.value.ephemeral_block_device != null ? each.value.ephemeral_block_device : []
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = ephemeral_block_device.value.no_device
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }

  dynamic "instance_market_options" {
    for_each = each.value.instance_market_options != null ? each.value.instance_market_options : []
    content {
      market_type = instance_market_options.value.market_type

      dynamic "spot_options" {
        for_each = instance_market_options.value.spot_options != null ? instance_market_options.value.spot_options : []
        content {
          instance_interruption_behavior = spot_options.value.instance_interruption_behavior
          max_price                      = spot_options.value.max_price
          spot_instance_type             = spot_options.value.spot_instance_type
          valid_until                    = spot_options.value.valid_until
        }
      }
    }
  }

  dynamic "launch_template" {
    for_each = each.value.launch_template != null ? each.value.launch_template : []
    content {
      name    = launch_template.value.name
      version = launch_template.value.version
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

  dynamic "network_interface" {
    for_each = each.value.network_interface != null ? each.value.network_interface : []
    content {
      device_index          = network_interface.value.device_index
      network_interface_id  = network_interface.value.network_interface_id
      delete_on_termination = network_interface.value.delete_on_termination
      network_card_index    = network_interface.value.network_card_index
    }
  }

  dynamic "primary_network_interface" {
    for_each = each.value.primary_network_interface != null ? each.value.primary_network_interface : []
    content {
      network_interface_id = primary_network_interface.value.network_interface_id
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

  dynamic "root_block_device" {
    for_each = each.value.root_block_device != null ? each.value.root_block_device : []
    content {
      delete_on_termination = root_block_device.value.delete_on_termination
      encrypted             = root_block_device.value.encrypted
      iops                  = root_block_device.value.iops
      kms_key_id            = root_block_device.value.kms_key_id
      tags                  = root_block_device.value.tags
      tags_all              = root_block_device.value.tags_all
      throughput            = root_block_device.value.throughput
      volume_size           = root_block_device.value.volume_size
      volume_type           = root_block_device.value.volume_type
    }
  }

  dynamic "secondary_network_interface" {
    for_each = each.value.secondary_network_interface != null ? each.value.secondary_network_interface : []
    content {
      network_card_index       = secondary_network_interface.value.network_card_index
      secondary_subnet_id      = secondary_network_interface.value.secondary_subnet_id
      delete_on_termination    = secondary_network_interface.value.delete_on_termination
      device_index             = secondary_network_interface.value.device_index
      interface_type           = secondary_network_interface.value.interface_type
      private_ip_address_count = secondary_network_interface.value.private_ip_address_count
    }
  }
}
