resource "aws_storagegateway_gateway" "storagegateway_gateways" {
  for_each = var.storagegateway_gateways

  gateway_name                                = each.value.gateway_name
  gateway_timezone                            = each.value.gateway_timezone
  activation_key                              = each.value.activation_key
  average_download_rate_limit_in_bits_per_sec = each.value.average_download_rate_limit_in_bits_per_sec
  average_upload_rate_limit_in_bits_per_sec   = each.value.average_upload_rate_limit_in_bits_per_sec
  cloudwatch_log_group_arn                    = each.value.cloudwatch_log_group_arn
  gateway_ip_address                          = each.value.gateway_ip_address
  gateway_type                                = each.value.gateway_type
  gateway_vpc_endpoint                        = each.value.gateway_vpc_endpoint
  medium_changer_type                         = each.value.medium_changer_type
  region                                      = each.value.region
  smb_file_share_visibility                   = each.value.smb_file_share_visibility
  smb_guest_password                          = each.value.smb_guest_password
  smb_security_strategy                       = each.value.smb_security_strategy
  tags                                        = each.value.tags
  tags_all                                    = each.value.tags_all
  tape_drive_type                             = each.value.tape_drive_type

  dynamic "maintenance_start_time" {
    for_each = each.value.maintenance_start_time != null ? each.value.maintenance_start_time : []
    content {
      hour_of_day    = maintenance_start_time.value.hour_of_day
      day_of_month   = maintenance_start_time.value.day_of_month
      day_of_week    = maintenance_start_time.value.day_of_week
      minute_of_hour = maintenance_start_time.value.minute_of_hour
    }
  }

  dynamic "smb_active_directory_settings" {
    for_each = each.value.smb_active_directory_settings != null ? each.value.smb_active_directory_settings : []
    content {
      domain_name         = smb_active_directory_settings.value.domain_name
      password            = smb_active_directory_settings.value.password
      username            = smb_active_directory_settings.value.username
      domain_controllers  = smb_active_directory_settings.value.domain_controllers
      organizational_unit = smb_active_directory_settings.value.organizational_unit
      timeout_in_seconds  = smb_active_directory_settings.value.timeout_in_seconds
    }
  }
}
