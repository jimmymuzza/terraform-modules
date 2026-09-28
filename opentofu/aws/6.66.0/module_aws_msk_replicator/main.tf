resource "aws_msk_replicator" "msk_replicators" {
  for_each = var.msk_replicators

  replicator_name            = each.value.replicator_name
  service_execution_role_arn = each.value.service_execution_role_arn
  description                = each.value.description
  region                     = each.value.region
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all

  dynamic "kafka_cluster" {
    for_each = each.value.kafka_cluster != null ? each.value.kafka_cluster : []
    content {

      dynamic "amazon_msk_cluster" {
        for_each = kafka_cluster.value.amazon_msk_cluster != null ? kafka_cluster.value.amazon_msk_cluster : []
        content {
          msk_cluster_arn = amazon_msk_cluster.value.msk_cluster_arn
        }
      }

      dynamic "apache_kafka_cluster" {
        for_each = kafka_cluster.value.apache_kafka_cluster != null ? kafka_cluster.value.apache_kafka_cluster : []
        content {
          apache_kafka_cluster_id = apache_kafka_cluster.value.apache_kafka_cluster_id
          bootstrap_broker_string = apache_kafka_cluster.value.bootstrap_broker_string
        }
      }

      dynamic "client_authentication" {
        for_each = kafka_cluster.value.client_authentication != null ? kafka_cluster.value.client_authentication : []
        content {

          dynamic "mtls" {
            for_each = client_authentication.value.mtls != null ? client_authentication.value.mtls : []
            content {
              secret_arn = mtls.value.secret_arn
            }
          }

          dynamic "sasl_scram" {
            for_each = client_authentication.value.sasl_scram != null ? client_authentication.value.sasl_scram : []
            content {
              mechanism  = sasl_scram.value.mechanism
              secret_arn = sasl_scram.value.secret_arn
            }
          }
        }
      }

      dynamic "encryption_in_transit" {
        for_each = kafka_cluster.value.encryption_in_transit != null ? kafka_cluster.value.encryption_in_transit : []
        content {
          root_ca_certificate = encryption_in_transit.value.root_ca_certificate
        }
      }

      dynamic "vpc_config" {
        for_each = kafka_cluster.value.vpc_config != null ? kafka_cluster.value.vpc_config : []
        content {
          subnet_ids          = vpc_config.value.subnet_ids
          security_groups_ids = vpc_config.value.security_groups_ids
        }
      }
    }
  }

  dynamic "log_delivery" {
    for_each = each.value.log_delivery != null ? each.value.log_delivery : []
    content {

      dynamic "replicator_log_delivery" {
        for_each = log_delivery.value.replicator_log_delivery != null ? log_delivery.value.replicator_log_delivery : []
        content {

          dynamic "cloudwatch_logs" {
            for_each = replicator_log_delivery.value.cloudwatch_logs != null ? replicator_log_delivery.value.cloudwatch_logs : []
            content {
              enabled   = cloudwatch_logs.value.enabled
              log_group = cloudwatch_logs.value.log_group
            }
          }

          dynamic "firehose" {
            for_each = replicator_log_delivery.value.firehose != null ? replicator_log_delivery.value.firehose : []
            content {
              enabled         = firehose.value.enabled
              delivery_stream = firehose.value.delivery_stream
            }
          }

          dynamic "s3" {
            for_each = replicator_log_delivery.value.s3 != null ? replicator_log_delivery.value.s3 : []
            content {
              enabled = s3.value.enabled
              bucket  = s3.value.bucket
              prefix  = s3.value.prefix
            }
          }
        }
      }
    }
  }

  dynamic "replication_info_list" {
    for_each = each.value.replication_info_list != null ? each.value.replication_info_list : []
    content {
      target_compression_type  = replication_info_list.value.target_compression_type
      source_kafka_cluster_arn = replication_info_list.value.source_kafka_cluster_arn
      source_kafka_cluster_id  = replication_info_list.value.source_kafka_cluster_id
      target_kafka_cluster_arn = replication_info_list.value.target_kafka_cluster_arn
      target_kafka_cluster_id  = replication_info_list.value.target_kafka_cluster_id

      dynamic "consumer_group_replication" {
        for_each = replication_info_list.value.consumer_group_replication != null ? replication_info_list.value.consumer_group_replication : []
        content {
          consumer_groups_to_replicate        = consumer_group_replication.value.consumer_groups_to_replicate
          consumer_group_offset_sync_mode     = consumer_group_replication.value.consumer_group_offset_sync_mode
          consumer_groups_to_exclude          = consumer_group_replication.value.consumer_groups_to_exclude
          detect_and_copy_new_consumer_groups = consumer_group_replication.value.detect_and_copy_new_consumer_groups
          synchronise_consumer_group_offsets  = consumer_group_replication.value.synchronise_consumer_group_offsets
        }
      }

      dynamic "topic_replication" {
        for_each = replication_info_list.value.topic_replication != null ? replication_info_list.value.topic_replication : []
        content {
          topics_to_replicate                  = topic_replication.value.topics_to_replicate
          copy_access_control_lists_for_topics = topic_replication.value.copy_access_control_lists_for_topics
          copy_topic_configurations            = topic_replication.value.copy_topic_configurations
          detect_and_copy_new_topics           = topic_replication.value.detect_and_copy_new_topics
          topics_to_exclude                    = topic_replication.value.topics_to_exclude

          dynamic "starting_position" {
            for_each = topic_replication.value.starting_position != null ? topic_replication.value.starting_position : []
            content {
              type = starting_position.value.type
            }
          }

          dynamic "topic_name_configuration" {
            for_each = topic_replication.value.topic_name_configuration != null ? topic_replication.value.topic_name_configuration : []
            content {
              type = topic_name_configuration.value.type
            }
          }
        }
      }
    }
  }
}
