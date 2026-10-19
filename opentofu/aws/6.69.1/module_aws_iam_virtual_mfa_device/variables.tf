variable "iam_virtual_mfa_devices" {
  description = <<EOT
Map of iam_virtual_mfa_devices, attributes below
Required:
    - virtual_mfa_device_name
Optional:
    - path
    - tags
    - tags_all
EOT

  type = map(object({
    virtual_mfa_device_name = string
    path                    = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
  }))
}
