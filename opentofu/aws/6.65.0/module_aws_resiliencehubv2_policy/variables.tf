variable "resiliencehubv2_policies" {
  description = <<EOT
Map of resiliencehubv2_policies, attributes below
Required:
    - name
Optional:
    - description
    - kms_key_id
    - region
    - tags
    - availability_slo
    - data_recovery
    - multi_az
    - multi_region
EOT

  type = map(object({
    name             = string
    description      = optional(string)
    kms_key_id       = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
    availability_slo = optional(list(object({
            target = number
        })))
    data_recovery    = optional(list(object({
            time_between_backups_in_minutes = number
        })))
    multi_az         = optional(list(object({
            disaster_recovery_approach = string
            rpo_in_minutes             = optional(number)
            rto_in_minutes             = optional(number)
        })))
    multi_region     = optional(list(object({
            disaster_recovery_approach = string
            rpo_in_minutes             = optional(number)
            rto_in_minutes             = optional(number)
        })))
  }))
}
