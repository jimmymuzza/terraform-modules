variable "emr_instance_fleets" {
  description = <<EOT
Map of emr_instance_fleets, attributes below
Required:
    - cluster_id
Optional:
    - name
    - region
    - target_on_demand_capacity
    - target_spot_capacity
    - instance_type_configs
    - launch_specifications
EOT

  type = map(object({
    cluster_id                = string
    name                      = optional(string)
    region                    = optional(string)
    target_on_demand_capacity = optional(number)
    target_spot_capacity      = optional(number)
    instance_type_configs     = optional(set(object({
            instance_type                              = string
            bid_price                                  = optional(string)
            bid_price_as_percentage_of_on_demand_price = optional(number)
            weighted_capacity                          = optional(number)
            configurations                             = optional(set(object({
                classification = optional(string)
                properties     = optional(map(string))
            })))
            ebs_config                                 = optional(set(object({
                size                 = number
                type                 = string
                iops                 = optional(number)
                volumes_per_instance = optional(number)
            })))
        })))
    launch_specifications     = optional(list(object({
            on_demand_specification = optional(list(object({
                allocation_strategy = string
            })))
            spot_specification      = optional(list(object({
                allocation_strategy      = string
                timeout_action           = string
                timeout_duration_minutes = number
                block_duration_minutes   = optional(number)
            })))
        })))
  }))
}
