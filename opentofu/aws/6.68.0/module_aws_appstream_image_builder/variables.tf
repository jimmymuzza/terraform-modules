variable "appstream_image_builders" {
  description = <<EOT
Map of appstream_image_builders, attributes below
Required:
    - instance_type
    - name
Optional:
    - appstream_agent_version
    - description
    - display_name
    - enable_default_internet_access
    - iam_role_arn
    - image_arn
    - image_name
    - region
    - tags
    - tags_all
    - access_endpoint
    - domain_join_info
    - vpc_config
EOT

  type = map(object({
    instance_type                  = string
    name                           = string
    appstream_agent_version        = optional(string)
    description                    = optional(string)
    display_name                   = optional(string)
    enable_default_internet_access = optional(bool)
    iam_role_arn                   = optional(string)
    image_arn                      = optional(string)
    image_name                     = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    access_endpoint                = optional(set(object({
            endpoint_type = string
            vpce_id       = optional(string)
        })))
    domain_join_info               = optional(list(object({
            directory_name                         = optional(string)
            organizational_unit_distinguished_name = optional(string)
        })))
    vpc_config                     = optional(list(object({
            security_group_ids = optional(set(string))
            subnet_ids         = optional(set(string))
        })))
  }))
}
