resource "aws_mskconnect_connector" "mskconnect_connectors" {
  for_each = var.mskconnect_connectors

  connector_configuration    = each.value.connector_configuration
  kafkaconnect_version       = each.value.kafkaconnect_version
  name                       = each.value.name
  service_execution_role_arn = each.value.service_execution_role_arn
  description                = each.value.description
  region                     = each.value.region
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all

  dynamic "capacity" {
    for_each = each.value.capacity != null ? each.value.capacity : []
    content {

      dynamic "autoscaling" {
        for_each = capacity.value.autoscaling != null ? capacity.value.autoscaling : []
        content {
          max_worker_count = autoscaling.value.max_worker_count
          min_worker_count = autoscaling.value.min_worker_count
          mcu_count        = autoscaling.value.mcu_count

          dynamic "scale_in_policy" {
            for_each = autoscaling.value.scale_in_policy != null ? autoscaling.value.scale_in_policy : []
            content {
              cpu_utilization_percentage = scale_in_policy.value.cpu_utilization_percentage
            }
          }

          dynamic "scale_out_policy" {
            for_each = autoscaling.value.scale_out_policy != null ? autoscaling.value.scale_out_policy : []
            content {
              cpu_utilization_percentage = scale_out_policy.value.cpu_utilization_percentage
            }
          }
        }
      }

      dynamic "provisioned_capacity" {
        for_each = capacity.value.provisioned_capacity != null ? capacity.value.provisioned_capacity : []
        content {
          worker_count = provisioned_capacity.value.worker_count
          mcu_count    = provisioned_capacity.value.mcu_count
        }
      }
    }
  }

  dynamic "kafka_cluster" {
    for_each = each.value.kafka_cluster != null ? each.value.kafka_cluster : []
    content {

      dynamic "apache_kafka_cluster" {
        for_each = kafka_cluster.value.apache_kafka_cluster != null ? kafka_cluster.value.apache_kafka_cluster : []
        content {
          bootstrap_servers = apache_kafka_cluster.value.bootstrap_servers

          dynamic "vpc" {
            for_each = apache_kafka_cluster.value.vpc != null ? apache_kafka_cluster.value.vpc : []
            content {
              security_groups = vpc.value.security_groups
              subnets         = vpc.value.subnets
            }
          }
        }
      }
    }
  }

  dynamic "kafka_cluster_client_authentication" {
    for_each = each.value.kafka_cluster_client_authentication != null ? each.value.kafka_cluster_client_authentication : []
    content {
      authentication_type = kafka_cluster_client_authentication.value.authentication_type
    }
  }

  dynamic "kafka_cluster_encryption_in_transit" {
    for_each = each.value.kafka_cluster_encryption_in_transit != null ? each.value.kafka_cluster_encryption_in_transit : []
    content {
      encryption_type = kafka_cluster_encryption_in_transit.value.encryption_type
    }
  }

  dynamic "log_delivery" {
    for_each = each.value.log_delivery != null ? each.value.log_delivery : []
    content {

      dynamic "worker_log_delivery" {
        for_each = log_delivery.value.worker_log_delivery != null ? log_delivery.value.worker_log_delivery : []
        content {

          dynamic "cloudwatch_logs" {
            for_each = worker_log_delivery.value.cloudwatch_logs != null ? worker_log_delivery.value.cloudwatch_logs : []
            content {
              enabled   = cloudwatch_logs.value.enabled
              log_group = cloudwatch_logs.value.log_group
            }
          }

          dynamic "firehose" {
            for_each = worker_log_delivery.value.firehose != null ? worker_log_delivery.value.firehose : []
            content {
              enabled         = firehose.value.enabled
              delivery_stream = firehose.value.delivery_stream
            }
          }

          dynamic "s3" {
            for_each = worker_log_delivery.value.s3 != null ? worker_log_delivery.value.s3 : []
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

  dynamic "plugin" {
    for_each = each.value.plugin != null ? each.value.plugin : []
    content {

      dynamic "custom_plugin" {
        for_each = plugin.value.custom_plugin != null ? plugin.value.custom_plugin : []
        content {
          arn      = custom_plugin.value.arn
          revision = custom_plugin.value.revision
        }
      }
    }
  }

  dynamic "worker_configuration" {
    for_each = each.value.worker_configuration != null ? each.value.worker_configuration : []
    content {
      arn      = worker_configuration.value.arn
      revision = worker_configuration.value.revision
    }
  }
}
