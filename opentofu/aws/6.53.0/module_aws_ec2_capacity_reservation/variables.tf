variable "ec2_capacity_reservations" {
  description = <<EOT
Map of ec2_capacity_reservations, attributes below
Required:
    - availability_zone
    - instance_count
    - instance_platform
    - instance_type
Optional:
    - ebs_optimized
    - end_date
    - end_date_type
    - ephemeral_storage
    - instance_match_criteria
    - outpost_arn
    - placement_group_arn
    - region
    - tags
    - tags_all
    - tenancy
EOT

  type = map(object({
    availability_zone       = string
    instance_count          = number
    instance_platform       = string
    instance_type           = string
    ebs_optimized           = optional(bool)
    end_date                = optional(string)
    end_date_type           = optional(string)
    ephemeral_storage       = optional(bool)
    instance_match_criteria = optional(string)
    outpost_arn             = optional(string)
    placement_group_arn     = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    tenancy                 = optional(string)
  }))
}
