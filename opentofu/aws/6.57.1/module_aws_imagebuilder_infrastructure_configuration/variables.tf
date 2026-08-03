variable "imagebuilder_infrastructure_configurations" {
  description = <<EOT
Map of imagebuilder_infrastructure_configurations, attributes below
Required:
    - instance_profile_name
    - name
Optional:
    - description
    - instance_types
    - key_pair
    - region
    - resource_tags
    - security_group_ids
    - sns_topic_arn
    - subnet_id
    - tags
    - tags_all
    - terminate_instance_on_failure
    - instance_metadata_options
    - logging
    - placement
EOT

  type = map(object({
    instance_profile_name         = string
    name                          = string
    description                   = optional(string)
    instance_types                = optional(set(string))
    key_pair                      = optional(string)
    region                        = optional(string)
    resource_tags                 = optional(map(string))
    security_group_ids            = optional(set(string))
    sns_topic_arn                 = optional(string)
    subnet_id                     = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    terminate_instance_on_failure = optional(bool)
    instance_metadata_options     = optional(list(object({
            http_put_response_hop_limit = optional(number)
            http_tokens                 = optional(string)
        })))
    logging                       = optional(list(object({
            s3_logs = list(object({
                s3_bucket_name = string
                s3_key_prefix  = optional(string)
            }))
        })))
    placement                     = optional(list(object({
            availability_zone       = optional(string)
            host_id                 = optional(string)
            host_resource_group_arn = optional(string)
            tenancy                 = optional(string)
        })))
  }))
}
