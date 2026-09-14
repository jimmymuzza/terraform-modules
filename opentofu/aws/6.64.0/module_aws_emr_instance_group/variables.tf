variable "emr_instance_groups" {
  description = <<EOT
Map of emr_instance_groups, attributes below
Required:
    - cluster_id
    - instance_type
Optional:
    - autoscaling_policy
    - bid_price
    - configurations_json
    - ebs_optimized
    - instance_count
    - name
    - region
    - ebs_config
EOT

  type = map(object({
    cluster_id          = string
    instance_type       = string
    autoscaling_policy  = optional(string)
    bid_price           = optional(string)
    configurations_json = optional(string)
    ebs_optimized       = optional(bool)
    instance_count      = optional(number)
    name                = optional(string)
    region              = optional(string)
    ebs_config          = optional(set(object({
            size                 = number
            type                 = string
            iops                 = optional(number)
            volumes_per_instance = optional(number)
        })))
  }))
}
