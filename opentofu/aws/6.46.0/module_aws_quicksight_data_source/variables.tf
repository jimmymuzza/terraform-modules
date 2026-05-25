variable "quicksight_data_sources" {
  description = <<EOT
Map of quicksight_data_sources, attributes below
Required:
    - data_source_id
    - name
    - type
    - parameters
Optional:
    - aws_account_id
    - region
    - tags
    - tags_all
    - credentials
    - permission
    - ssl_properties
    - vpc_connection_properties
EOT

  type = map(object({
    data_source_id            = string
    name                      = string
    type                      = string
    aws_account_id            = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    credentials               = optional(list(object({
            copy_source_arn = optional(string)
            secret_arn      = optional(string)
            credential_pair = optional(list(object({
                password = string
                username = string
            })))
        })))
    parameters                = list(object({
            amazon_elasticsearch = optional(list(object({
                domain = string
            })))
            athena               = optional(list(object({
                work_group = optional(string)
            })))
            aurora               = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            aurora_postgresql    = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            aws_iot_analytics    = optional(list(object({
                data_set_name = string
            })))
            databricks           = optional(list(object({
                host              = string
                port              = number
                sql_endpoint_path = string
            })))
            jira                 = optional(list(object({
                site_base_url = string
            })))
            maria_db             = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            mysql                = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            oracle               = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            postgresql           = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            presto               = optional(list(object({
                catalog = string
                host    = string
                port    = number
            })))
            rds                  = optional(list(object({
                database    = string
                instance_id = string
            })))
            redshift             = optional(list(object({
                database   = string
                cluster_id = optional(string)
                host       = optional(string)
                port       = optional(number)
            })))
            s3                   = optional(list(object({
                role_arn               = optional(string)
                manifest_file_location = list(object({
                    bucket = string
                    key    = string
                }))
            })))
            service_now          = optional(list(object({
                site_base_url = string
            })))
            snowflake            = optional(list(object({
                database  = string
                host      = string
                warehouse = string
            })))
            spark                = optional(list(object({
                host = string
                port = number
            })))
            sql_server           = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            teradata             = optional(list(object({
                database = string
                host     = string
                port     = number
            })))
            twitter              = optional(list(object({
                max_rows = number
                query    = string
            })))
        }))
    permission                = optional(set(object({
            actions   = set(string)
            principal = string
        })))
    ssl_properties            = optional(list(object({
            disable_ssl = bool
        })))
    vpc_connection_properties = optional(list(object({
            vpc_connection_arn = string
        })))
  }))
}
