variable "mskconnect_connectors" {
  description = <<EOT
Map of mskconnect_connectors, attributes below
Required:
    - connector_configuration
    - kafkaconnect_version
    - name
    - service_execution_role_arn
    - capacity
    - kafka_cluster
    - kafka_cluster_client_authentication
    - kafka_cluster_encryption_in_transit
    - plugin
Optional:
    - description
    - region
    - tags
    - tags_all
    - log_delivery
    - worker_configuration
EOT

  type = map(object({
    connector_configuration             = map(string)
    kafkaconnect_version                = string
    name                                = string
    service_execution_role_arn          = string
    description                         = optional(string)
    region                              = optional(string)
    tags                                = optional(map(string))
    tags_all                            = optional(map(string))
    capacity                            = list(object({
            autoscaling          = optional(list(object({
                max_worker_count = number
                min_worker_count = number
                mcu_count        = optional(number)
                scale_in_policy  = optional(list(object({
                    cpu_utilization_percentage = optional(number)
                })))
                scale_out_policy = optional(list(object({
                    cpu_utilization_percentage = optional(number)
                })))
            })))
            provisioned_capacity = optional(list(object({
                worker_count = number
                mcu_count    = optional(number)
            })))
        }))
    kafka_cluster                       = list(object({
            apache_kafka_cluster = list(object({
                bootstrap_servers = string
                vpc               = list(object({
                    security_groups = set(string)
                    subnets         = set(string)
                }))
            }))
        }))
    kafka_cluster_client_authentication = list(object({
            authentication_type = optional(string)
        }))
    kafka_cluster_encryption_in_transit = list(object({
            encryption_type = optional(string)
        }))
    log_delivery                        = optional(list(object({
            worker_log_delivery = list(object({
                cloudwatch_logs = optional(list(object({
                    enabled   = bool
                    log_group = optional(string)
                })))
                firehose        = optional(list(object({
                    enabled         = bool
                    delivery_stream = optional(string)
                })))
                s3              = optional(list(object({
                    enabled = bool
                    bucket  = optional(string)
                    prefix  = optional(string)
                })))
            }))
        })))
    plugin                              = set(object({
            custom_plugin = list(object({
                arn      = string
                revision = number
            }))
        }))
    worker_configuration                = optional(list(object({
            arn      = string
            revision = number
        })))
  }))
}
