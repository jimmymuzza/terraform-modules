variable "glue_crawlers" {
  description = <<EOT
Map of glue_crawlers, attributes below
Required:
    - database_name
    - name
    - role
Optional:
    - classifiers
    - configuration
    - description
    - region
    - schedule
    - security_configuration
    - table_prefix
    - tags
    - tags_all
    - catalog_target
    - delta_target
    - dynamodb_target
    - hudi_target
    - iceberg_target
    - jdbc_target
    - lake_formation_configuration
    - lineage_configuration
    - mongodb_target
    - recrawl_policy
    - s3_target
    - schema_change_policy
EOT

  type = map(object({
    database_name                = string
    name                         = string
    role                         = string
    classifiers                  = optional(list(string))
    configuration                = optional(string)
    description                  = optional(string)
    region                       = optional(string)
    schedule                     = optional(string)
    security_configuration       = optional(string)
    table_prefix                 = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    catalog_target               = optional(list(object({
            database_name       = string
            tables              = list(string)
            connection_name     = optional(string)
            dlq_event_queue_arn = optional(string)
            event_queue_arn     = optional(string)
        })))
    delta_target                 = optional(list(object({
            delta_tables              = set(string)
            write_manifest            = bool
            connection_name           = optional(string)
            create_native_delta_table = optional(bool)
        })))
    dynamodb_target              = optional(list(object({
            path      = string
            scan_all  = optional(bool)
            scan_rate = optional(number)
        })))
    hudi_target                  = optional(list(object({
            maximum_traversal_depth = number
            paths                   = set(string)
            connection_name         = optional(string)
            exclusions              = optional(list(string))
        })))
    iceberg_target               = optional(list(object({
            maximum_traversal_depth = number
            paths                   = set(string)
            connection_name         = optional(string)
            exclusions              = optional(list(string))
        })))
    jdbc_target                  = optional(list(object({
            connection_name            = string
            path                       = string
            enable_additional_metadata = optional(list(string))
            exclusions                 = optional(list(string))
        })))
    lake_formation_configuration = optional(list(object({
            account_id                     = optional(string)
            use_lake_formation_credentials = optional(bool)
        })))
    lineage_configuration        = optional(list(object({
            crawler_lineage_settings = optional(string)
        })))
    mongodb_target               = optional(list(object({
            connection_name = string
            path            = string
            scan_all        = optional(bool)
        })))
    recrawl_policy               = optional(list(object({
            recrawl_behavior = optional(string)
        })))
    s3_target                    = optional(list(object({
            path                = string
            connection_name     = optional(string)
            dlq_event_queue_arn = optional(string)
            event_queue_arn     = optional(string)
            exclusions          = optional(list(string))
            sample_size         = optional(number)
        })))
    schema_change_policy         = optional(list(object({
            delete_behavior = optional(string)
            update_behavior = optional(string)
        })))
  }))
}
