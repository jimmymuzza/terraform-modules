variable "security_center_settings" {
  description = <<EOT
Map of security_center_settings, attributes below
Required:
    - enabled
    - setting_name
EOT

  type = map(object({
    enabled      = bool
    setting_name = string
  }))
}
