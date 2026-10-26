variable "appstream_fleets" {
  description = <<EOT
Map of appstream_fleets, attributes below
Required:
    - instance_type
    - name
    - compute_capacity
Optional:
    - description
    - disconnect_timeout_in_seconds
    - display_name
    - enable_default_internet_access
    - fleet_type
    - iam_role_arn
    - idle_disconnect_timeout_in_seconds
    - image_arn
    - image_name
    - max_sessions_per_instance
    - max_user_duration_in_seconds
    - region
    - stream_view
    - tags
    - tags_all
    - domain_join_info
    - vpc_config
EOT

  type = map(object({
    instance_type                      = string
    name                               = string
    description                        = optional(string)
    disconnect_timeout_in_seconds      = optional(number)
    display_name                       = optional(string)
    enable_default_internet_access     = optional(bool)
    fleet_type                         = optional(string)
    iam_role_arn                       = optional(string)
    idle_disconnect_timeout_in_seconds = optional(number)
    image_arn                          = optional(string)
    image_name                         = optional(string)
    max_sessions_per_instance          = optional(number)
    max_user_duration_in_seconds       = optional(number)
    region                             = optional(string)
    stream_view                        = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    compute_capacity                   = list(object({
            desired_instances = optional(number)
            desired_sessions  = optional(number)
        }))
    domain_join_info                   = optional(list(object({
            directory_name                         = optional(string)
            organizational_unit_distinguished_name = optional(string)
        })))
    vpc_config                         = optional(list(object({
            security_group_ids = optional(list(string))
            subnet_ids         = optional(list(string))
        })))
  }))
}
