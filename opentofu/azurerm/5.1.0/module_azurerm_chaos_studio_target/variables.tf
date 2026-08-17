variable "chaos_studio_targets" {
  description = <<EOT
Map of chaos_studio_targets, attributes below
Required:
    - location
    - target_resource_id
    - target_type
EOT

  type = map(object({
    location           = string
    target_resource_id = string
    target_type        = string
  }))
}
