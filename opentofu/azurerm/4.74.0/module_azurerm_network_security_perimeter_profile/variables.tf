variable "network_security_perimeter_profiles" {
  description = <<EOT
Map of network_security_perimeter_profiles, attributes below
Required:
    - name
    - network_security_perimeter_id
EOT

  type = map(object({
    name                          = string
    network_security_perimeter_id = string
  }))
}
