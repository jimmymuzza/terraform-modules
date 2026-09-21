variable "codebuild_fleets" {
  description = <<EOT
Map of codebuild_fleets, attributes below
Required:
    - base_capacity
    - compute_type
    - environment_type
    - name
Optional:
    - fleet_service_role
    - image_id
    - overflow_behavior
    - region
    - tags
    - tags_all
    - compute_configuration
    - scaling_configuration
    - vpc_config
EOT

  type = map(object({
    base_capacity         = number
    compute_type          = string
    environment_type      = string
    name                  = string
    fleet_service_role    = optional(string)
    image_id              = optional(string)
    overflow_behavior     = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    compute_configuration = optional(list(object({
            disk          = optional(number)
            instance_type = optional(string)
            machine_type  = optional(string)
            memory        = optional(number)
            vcpu          = optional(number)
        })))
    scaling_configuration = optional(list(object({
            max_capacity                    = optional(number)
            scaling_type                    = optional(string)
            target_tracking_scaling_configs = optional(list(object({
                metric_type  = optional(string)
                target_value = optional(number)
            })))
        })))
    vpc_config            = optional(list(object({
            security_group_ids = set(string)
            subnets            = set(string)
            vpc_id             = string
        })))
  }))
}
