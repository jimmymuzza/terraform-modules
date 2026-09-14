variable "inspector2_enablers" {
  description = <<EOT
Map of inspector2_enablers, attributes below
Required:
    - account_ids
    - resource_types
Optional:
    - region
EOT

  type = map(object({
    account_ids    = set(string)
    resource_types = set(string)
    region         = optional(string)
  }))
}
