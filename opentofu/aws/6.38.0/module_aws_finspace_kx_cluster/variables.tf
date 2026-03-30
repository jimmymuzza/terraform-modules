variable "finspace_kx_clusters" {
  description = <<EOT
Map of finspace_kx_clusters, attributes below
Required:
    - az_mode
    - environment_id
    - name
    - release_label
    - type
    - vpc_configuration
Optional:
    - availability_zone_id
    - command_line_arguments
    - description
    - execution_role
    - initialization_script
    - region
    - tags
    - tags_all
    - auto_scaling_configuration
    - cache_storage_configurations
    - capacity_configuration
    - code
    - database
    - savedown_storage_configuration
    - scaling_group_configuration
    - tickerplant_log_configuration
EOT

  type = map(object({
    az_mode                        = string
    environment_id                 = string
    name                           = string
    release_label                  = string
    type                           = string
    availability_zone_id           = optional(string)
    command_line_arguments         = optional(map(string))
    description                    = optional(string)
    execution_role                 = optional(string)
    initialization_script          = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    auto_scaling_configuration     = optional(list(object({
            auto_scaling_metric        = string
            max_node_count             = number
            metric_target              = number
            min_node_count             = number
            scale_in_cooldown_seconds  = number
            scale_out_cooldown_seconds = number
        })))
    cache_storage_configurations   = optional(list(object({
            size = number
            type = string
        })))
    capacity_configuration         = optional(list(object({
            node_count = number
            node_type  = string
        })))
    code                           = optional(list(object({
            s3_bucket         = string
            s3_key            = string
            s3_object_version = optional(string)
        })))
    database                       = optional(list(object({
            database_name        = string
            changeset_id         = optional(string)
            dataview_name        = optional(string)
            cache_configurations = optional(list(object({
                cache_type = string
                db_paths   = optional(set(string))
            })))
        })))
    savedown_storage_configuration = optional(list(object({
            size        = optional(number)
            type        = optional(string)
            volume_name = optional(string)
        })))
    scaling_group_configuration    = optional(list(object({
            memory_reservation = number
            node_count         = number
            scaling_group_name = string
            cpu                = optional(number)
            memory_limit       = optional(number)
        })))
    tickerplant_log_configuration  = optional(list(object({
            tickerplant_log_volumes = set(string)
        })))
    vpc_configuration              = list(object({
            ip_address_type    = string
            security_group_ids = set(string)
            subnet_ids         = set(string)
            vpc_id             = string
        }))
  }))
}
