variable "sagemaker_device_fleets" {
  description = <<EOT
Map of sagemaker_device_fleets, attributes below
Required:
    - device_fleet_name
    - role_arn
    - output_config
Optional:
    - description
    - enable_iot_role_alias
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    device_fleet_name     = string
    role_arn              = string
    description           = optional(string)
    enable_iot_role_alias = optional(bool)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    output_config         = list(object({
            s3_output_location = string
            kms_key_id         = optional(string)
        }))
  }))
}
