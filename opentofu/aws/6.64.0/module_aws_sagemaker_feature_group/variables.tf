variable "sagemaker_feature_groups" {
  description = <<EOT
Map of sagemaker_feature_groups, attributes below
Required:
    - event_time_feature_name
    - feature_group_name
    - record_identifier_feature_name
    - role_arn
    - feature_definition
Optional:
    - description
    - region
    - tags
    - tags_all
    - offline_store_config
    - online_store_config
    - throughput_config
EOT

  type = map(object({
    event_time_feature_name        = string
    feature_group_name             = string
    record_identifier_feature_name = string
    role_arn                       = string
    description                    = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    tags_all                       = optional(map(string))
    feature_definition             = list(object({
            collection_type   = optional(string)
            feature_name      = optional(string)
            feature_type      = optional(string)
            collection_config = optional(list(object({
                vector_config = optional(list(object({
                    dimension = optional(number)
                })))
            })))
        }))
    offline_store_config           = optional(list(object({
            disable_glue_table_creation = optional(bool)
            table_format                = optional(string)
            data_catalog_config         = optional(list(object({
                catalog    = optional(string)
                database   = optional(string)
                table_name = optional(string)
            })))
            s3_storage_config           = list(object({
                s3_uri                 = string
                kms_key_id             = optional(string)
                resolved_output_s3_uri = optional(string)
            }))
        })))
    online_store_config            = optional(list(object({
            enable_online_store = optional(bool)
            storage_type        = optional(string)
            security_config     = optional(list(object({
                kms_key_id = optional(string)
            })))
            ttl_duration        = optional(list(object({
                unit  = optional(string)
                value = optional(number)
            })))
        })))
    throughput_config              = optional(list(object({
            provisioned_read_capacity_units  = optional(number)
            provisioned_write_capacity_units = optional(number)
            throughput_mode                  = optional(string)
        })))
  }))
}
