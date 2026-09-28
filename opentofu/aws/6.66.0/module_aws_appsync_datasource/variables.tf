variable "appsync_datasources" {
  description = <<EOT
Map of appsync_datasources, attributes below
Required:
    - api_id
    - name
    - type
Optional:
    - description
    - region
    - service_role_arn
    - dynamodb_config
    - elasticsearch_config
    - event_bridge_config
    - http_config
    - lambda_config
    - opensearchservice_config
    - relational_database_config
EOT

  type = map(object({
    api_id                     = string
    name                       = string
    type                       = string
    description                = optional(string)
    region                     = optional(string)
    service_role_arn           = optional(string)
    dynamodb_config            = optional(list(object({
            table_name             = string
            region                 = optional(string)
            use_caller_credentials = optional(bool)
            versioned              = optional(bool)
            delta_sync_config      = optional(list(object({
                delta_sync_table_name = string
                base_table_ttl        = optional(number)
                delta_sync_table_ttl  = optional(number)
            })))
        })))
    elasticsearch_config       = optional(list(object({
            endpoint = string
            region   = optional(string)
        })))
    event_bridge_config        = optional(list(object({
            event_bus_arn = string
        })))
    http_config                = optional(list(object({
            endpoint             = string
            authorization_config = optional(list(object({
                authorization_type = optional(string)
                aws_iam_config     = optional(list(object({
                    signing_region       = optional(string)
                    signing_service_name = optional(string)
                })))
            })))
        })))
    lambda_config              = optional(list(object({
            function_arn = string
        })))
    opensearchservice_config   = optional(list(object({
            endpoint = string
            region   = optional(string)
        })))
    relational_database_config = optional(list(object({
            source_type          = optional(string)
            http_endpoint_config = optional(list(object({
                aws_secret_store_arn  = string
                db_cluster_identifier = string
                database_name         = optional(string)
                region                = optional(string)
                schema                = optional(string)
            })))
        })))
  }))
}
