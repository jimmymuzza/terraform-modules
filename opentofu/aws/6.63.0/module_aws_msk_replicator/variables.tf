variable "msk_replicators" {
  description = <<EOT
Map of msk_replicators, attributes below
Required:
    - replicator_name
    - service_execution_role_arn
    - kafka_cluster
    - replication_info_list
Optional:
    - description
    - region
    - tags
    - tags_all
    - log_delivery
EOT

  type = map(object({
    replicator_name            = string
    service_execution_role_arn = string
    description                = optional(string)
    region                     = optional(string)
    tags                       = optional(map(string))
    tags_all                   = optional(map(string))
    kafka_cluster              = list(object({
            amazon_msk_cluster = list(object({
                msk_cluster_arn = string
            }))
            vpc_config         = list(object({
                subnet_ids          = set(string)
                security_groups_ids = optional(set(string))
            }))
        }))
    log_delivery               = optional(list(object({
            replicator_log_delivery = optional(list(object({
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
            })))
        })))
    replication_info_list      = list(object({
            source_kafka_cluster_arn   = string
            target_compression_type    = string
            target_kafka_cluster_arn   = string
            consumer_group_replication = list(object({
                consumer_groups_to_replicate        = set(string)
                consumer_group_offset_sync_mode     = optional(string)
                consumer_groups_to_exclude          = optional(set(string))
                detect_and_copy_new_consumer_groups = optional(bool)
                synchronise_consumer_group_offsets  = optional(bool)
            }))
            topic_replication          = list(object({
                topics_to_replicate                  = set(string)
                copy_access_control_lists_for_topics = optional(bool)
                copy_topic_configurations            = optional(bool)
                detect_and_copy_new_topics           = optional(bool)
                topics_to_exclude                    = optional(set(string))
                starting_position                    = optional(list(object({
                    type = optional(string)
                })))
                topic_name_configuration             = optional(list(object({
                    type = optional(string)
                })))
            }))
        }))
  }))
}
