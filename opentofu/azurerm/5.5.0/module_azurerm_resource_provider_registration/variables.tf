variable "resource_provider_registrations" {
  description = <<EOT
Map of resource_provider_registrations, attributes below
Required:
    - name
Optional:
    - feature
EOT

  type = map(object({
    name    = string
    feature = optional(set(object({
            name       = string
            registered = bool
        })))
  }))
}
