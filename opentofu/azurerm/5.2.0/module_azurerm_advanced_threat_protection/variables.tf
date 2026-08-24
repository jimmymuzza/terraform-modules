variable "advanced_threat_protections" {
  description = <<EOT
Map of advanced_threat_protections, attributes below
Required:
    - enabled
    - target_resource_id
EOT

  type = map(object({
    enabled            = bool
    target_resource_id = string
  }))
}
