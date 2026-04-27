variable "storagegateway_gateways" {
  description = <<EOT
Map of storagegateway_gateways, attributes below
Required:
    - gateway_name
    - gateway_timezone
Optional:
    - activation_key
    - average_download_rate_limit_in_bits_per_sec
    - average_upload_rate_limit_in_bits_per_sec
    - cloudwatch_log_group_arn
    - gateway_ip_address
    - gateway_type
    - gateway_vpc_endpoint
    - medium_changer_type
    - region
    - smb_file_share_visibility
    - smb_guest_password
    - smb_security_strategy
    - tags
    - tags_all
    - tape_drive_type
    - maintenance_start_time
    - smb_active_directory_settings
EOT

  type = map(object({
    gateway_name                                = string
    gateway_timezone                            = string
    activation_key                              = optional(string)
    average_download_rate_limit_in_bits_per_sec = optional(number)
    average_upload_rate_limit_in_bits_per_sec   = optional(number)
    cloudwatch_log_group_arn                    = optional(string)
    gateway_ip_address                          = optional(string)
    gateway_type                                = optional(string)
    gateway_vpc_endpoint                        = optional(string)
    medium_changer_type                         = optional(string)
    region                                      = optional(string)
    smb_file_share_visibility                   = optional(bool)
    smb_guest_password                          = optional(string)
    smb_security_strategy                       = optional(string)
    tags                                        = optional(map(string))
    tags_all                                    = optional(map(string))
    tape_drive_type                             = optional(string)
    maintenance_start_time                      = optional(list(object({
            hour_of_day    = number
            day_of_month   = optional(string)
            day_of_week    = optional(string)
            minute_of_hour = optional(number)
        })))
    smb_active_directory_settings               = optional(list(object({
            domain_name         = string
            password            = string
            username            = string
            domain_controllers  = optional(set(string))
            organizational_unit = optional(string)
            timeout_in_seconds  = optional(number)
        })))
  }))
}
