variable "sagemaker_devices" {
  description = <<EOT
Map of sagemaker_devices, attributes below
Required:
    - device_fleet_name
    - device
Optional:
    - region
EOT

  type = map(object({
    device_fleet_name = string
    region            = optional(string)
    device            = list(object({
            device_name    = string
            description    = optional(string)
            iot_thing_name = optional(string)
        }))
  }))
}
