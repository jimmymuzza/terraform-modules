variable "security_center_auto_provisionings" {
  description = <<EOT
Map of security_center_auto_provisionings, attributes below
Required:
    - auto_provision
EOT

  type = map(object({
    auto_provision = string
  }))
}
