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

      dynamic "vpc_config" {
        for_each = kafka_cluster.value.vpc_config != null ? kafka_cluster.value.vpc_config : []
        content {
          subnet_ids          = vpc_config.value.subnet_ids
          security_groups_ids = vpc_config.value.security_groups_ids
        }
      }
    }
  }

  dynamic "replication_info_list" {
    for_each = each.value.replication_info_list != null ? each.value.replication_info_list : []
    content {
      source_kafka_cluster_arn = replication_info_list.value.source_kafka_cluster_arn
      target_compression_type  = replication_info_list.value.target_compression_type
      target_kafka_cluster_arn = replication_info_list.value.target_kafka_cluster_arn

      dynamic "consumer_group_replication" {
        for_each = replication_info_list.value.consumer_group_replication != null ? replication_info_list.value.consumer_group_replication : []
        content {
          consumer_groups_to_replicate        = consumer_group_replication.value.consumer_groups_to_replicate
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
