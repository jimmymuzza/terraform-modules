variable "resource_provider_feature_registrations" {
  description = <<EOT
Map of resource_provider_feature_registrations, attributes below
Required:
    - name
    - provider_name
EOT

  type = map(object({
    name          = string
    provider_name = string
  }))
}
