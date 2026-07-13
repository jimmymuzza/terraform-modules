variable "efs_replication_configurations" {
  description = <<EOT
Map of efs_replication_configurations, attributes below
Required:
    - source_file_system_id
    - destination
Optional:
    - region
EOT

  type = map(object({
    source_file_system_id = string
    region                = optional(string)
    destination           = list(object({
            availability_zone_name = optional(string)
            file_system_id         = optional(string)
            kms_key_id             = optional(string)
            region                 = optional(string)
        }))
  }))
}
