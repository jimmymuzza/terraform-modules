variable "dms_instance_profiles" {
  description = <<EOT
Map of dms_instance_profiles, attributes below
Optional:
    - availability_zone
    - description
    - kms_key_arn
    - name
    - network_type
    - publicly_accessible
    - region
    - subnet_group_identifier
    - tags
    - vpc_security_group_ids
EOT

  type = map(object({
    availability_zone       = optional(string)
    description             = optional(string)
    kms_key_arn             = optional(string)
    name                    = optional(string)
    network_type            = optional(string)
    publicly_accessible     = optional(bool)
    region                  = optional(string)
    subnet_group_identifier = optional(string)
    tags                    = optional(map(string))
    vpc_security_group_ids  = optional(set(string))
  }))
}
