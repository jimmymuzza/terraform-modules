variable "netapp_volume_quota_rules" {
  description = <<EOT
Map of netapp_volume_quota_rules, attributes below
Required:
    - location
    - name
    - quota_size_in_kib
    - quota_type
    - volume_id
Optional:
    - quota_target
EOT

  type = map(object({
    location          = string
    name              = string
    quota_size_in_kib = number
    quota_type        = string
    volume_id         = string
    quota_target      = optional(string)
  }))
}
