resource "aws_msk_cluster" "msk_clusters" {
  for_each = var.msk_clusters

  cluster_name           = each.value.cluster_name
  kafka_version          = each.value.kafka_version
  number_of_broker_nodes = each.value.number_of_broker_nodes
  enhanced_monitoring    = each.value.enhanced_monitoring
  region                 = each.value.region
  storage_mode           = each.value.storage_mode
  tags                   = each.value.tags
  tags_all               = each.value.tags_all

  dynamic "broker_node_group_info" {
    for_each = each.value.broker_node_group_info != null ? each.value.broker_node_group_info : []
    content {
      client_subnets  = broker_node_group_info.value.client_subnets
      instance_type   = broker_node_group_info.value.instance_type
      security_groups = broker_node_group_info.value.security_groups
      az_distribution = broker_node_group_info.value.az_distribution

      dynamic "connectivity_info" {
        for_each = broker_node_group_info.value.connectivity_info != null ? broker_node_group_info.value.connectivity_info : []
        content {
          network_type = connectivity_info.value.network_type

          dynamic "public_access" {
            for_each = connectivity_info.value.public_access != null ? connectivity_info.value.public_access : []
            content {
              type = public_access.value.type
            }
          }

          dynamic "vpc_connectivity" {
            for_each = connectivity_info.value.vpc_connectivity != null ? connectivity_info.value.vpc_connectivity : []
            content {

              dynamic "client_authentication" {
                for_each = vpc_connectivity.value.client_authentication != null ? vpc_connectivity.value.client_authentication : []
                content {
                  tls = client_authentication.value.tls

                  dynamic "sasl" {
                    for_each = client_authentication.value.sasl != null ? client_authentication.value.sasl : []
                    content {
                      iam   = sasl.value.iam
                      scram = sasl.value.scram
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "storage_info" {
        for_each = broker_node_group_info.value.storage_info != null ? broker_node_group_info.value.storage_info : []
        content {

          dynamic "ebs_storage_info" {
            for_each = storage_info.value.ebs_storage_info != null ? storage_info.value.ebs_storage_info : []
            content {
              volume_size = ebs_storage_info.value.volume_size

              dynamic "provisioned_throughput" {
                for_each = ebs_storage_info.value.provisioned_throughput != null ? ebs_storage_info.value.provisioned_throughput : []
                content {
                  enabled           = provisioned_throughput.value.enabled
                  volume_throughput = provisioned_throughput.value.volume_throughput
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "client_authentication" {
    for_each = each.value.client_authentication != null ? each.value.client_authentication : []
    content {
      unauthenticated = client_authentication.value.unauthenticated

      dynamic "sasl" {
        for_each = client_authentication.value.sasl != null ? client_authentication.value.sasl : []
        content {
          iam   = sasl.value.iam
          scram = sasl.value.scram
        }
      }

      dynamic "tls" {
        for_each = client_authentication.value.tls != null ? client_authentication.value.tls : []
        content {
          certificate_authority_arns = tls.value.certificate_authority_arns
        }
      }
    }
  }

  dynamic "configuration_info" {
    for_each = each.value.configuration_info != null ? each.value.configuration_info : []
    content {
      arn      = configuration_info.value.arn
      revision = configuration_info.value.revision
    }
  }

  dynamic "encryption_info" {
    for_each = each.value.encryption_info != null ? each.value.encryption_info : []
    content {
      encryption_at_rest_kms_key_arn = encryption_info.value.encryption_at_rest_kms_key_arn

      dynamic "encryption_in_transit" {
        for_each = encryption_info.value.encryption_in_transit != null ? encryption_info.value.encryption_in_transit : []
        content {
          client_broker = encryption_in_transit.value.client_broker
          in_cluster    = encryption_in_transit.value.in_cluster
        }
      }
    }
  }

  dynamic "logging_info" {
    for_each = each.value.logging_info != null ? each.value.logging_info : []
    content {

      dynamic "broker_logs" {
        for_each = logging_info.value.broker_logs != null ? logging_info.value.broker_logs : []
        content {

          dynamic "cloudwatch_logs" {
            for_each = broker_logs.value.cloudwatch_logs != null ? broker_logs.value.cloudwatch_logs : []
            content {
              enabled   = cloudwatch_logs.value.enabled
              log_group = cloudwatch_logs.value.log_group
            }
          }

          dynamic "firehose" {
            for_each = broker_logs.value.firehose != null ? broker_logs.value.firehose : []
            content {
              enabled         = firehose.value.enabled
              delivery_stream = firehose.value.delivery_stream
            }
          }

          dynamic "s3" {
            for_each = broker_logs.value.s3 != null ? broker_logs.value.s3 : []
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

  dynamic "open_monitoring" {
    for_each = each.value.open_monitoring != null ? each.value.open_monitoring : []
    content {

      dynamic "prometheus" {
        for_each = open_monitoring.value.prometheus != null ? open_monitoring.value.prometheus : []
        content {

          dynamic "jmx_exporter" {
            for_each = prometheus.value.jmx_exporter != null ? prometheus.value.jmx_exporter : []
            content {
              enabled_in_broker = jmx_exporter.value.enabled_in_broker
            }
          }

          dynamic "node_exporter" {
            for_each = prometheus.value.node_exporter != null ? prometheus.value.node_exporter : []
            content {
              enabled_in_broker = node_exporter.value.enabled_in_broker
            }
          }
        }
      }
    }
  }

  dynamic "rebalancing" {
    for_each = each.value.rebalancing != null ? each.value.rebalancing : []
    content {
      status = rebalancing.value.status
    }
  }
}
