variable "msk_clusters" {
  description = <<EOT
Map of msk_clusters, attributes below
Required:
    - cluster_name
    - kafka_version
    - number_of_broker_nodes
    - broker_node_group_info
Optional:
    - enhanced_monitoring
    - region
    - storage_mode
    - tags
    - tags_all
    - client_authentication
    - configuration_info
    - encryption_info
    - logging_info
    - open_monitoring
    - rebalancing
EOT

  type = map(object({
    cluster_name           = string
    kafka_version          = string
    number_of_broker_nodes = number
    enhanced_monitoring    = optional(string)
    region                 = optional(string)
    storage_mode           = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    broker_node_group_info = list(object({
            client_subnets    = set(string)
            instance_type     = string
            security_groups   = set(string)
            az_distribution   = optional(string)
            connectivity_info = optional(list(object({
                public_access    = optional(list(object({
                    type = optional(string)
                })))
                vpc_connectivity = optional(list(object({
                    client_authentication = optional(list(object({
                        tls  = optional(bool)
                        sasl = optional(list(object({
                            iam   = optional(bool)
                            scram = optional(bool)
                        })))
                    })))
                })))
            })))
            storage_info      = optional(list(object({
                ebs_storage_info = optional(list(object({
                    volume_size            = optional(number)
                    provisioned_throughput = optional(list(object({
                        enabled           = optional(bool)
                        volume_throughput = optional(number)
                    })))
                })))
            })))
        }))
    client_authentication  = optional(list(object({
            unauthenticated = optional(bool)
            sasl            = optional(list(object({
                iam   = optional(bool)
                scram = optional(bool)
            })))
            tls             = optional(list(object({
                certificate_authority_arns = optional(set(string))
            })))
        })))
    configuration_info     = optional(list(object({
            arn      = string
            revision = number
        })))
    encryption_info        = optional(list(object({
            encryption_at_rest_kms_key_arn = optional(string)
            encryption_in_transit          = optional(list(object({
                client_broker = optional(string)
                in_cluster    = optional(bool)
            })))
        })))
    logging_info           = optional(list(object({
            broker_logs = list(object({
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
    open_monitoring        = optional(list(object({
            prometheus = list(object({
                jmx_exporter  = optional(list(object({
                    enabled_in_broker = bool
                })))
                node_exporter = optional(list(object({
                    enabled_in_broker = bool
                })))
            }))
        })))
    rebalancing            = optional(list(object({
            status = string
        })))
  }))
}
