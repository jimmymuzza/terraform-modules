variable "network_security_perimeter_associations" {
  description = <<EOT
Map of network_security_perimeter_associations, attributes below
Required:
    - access_mode
    - name
    - network_security_perimeter_profile_id
    - resource_id
EOT

  type = map(object({
    access_mode                           = string
    name                                  = string
    network_security_perimeter_profile_id = string
    resource_id                           = string
  }))
}
