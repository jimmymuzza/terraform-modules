resource "aws_bedrockagent_knowledge_base" "bedrockagent_knowledge_bases" {
  for_each = var.bedrockagent_knowledge_bases

  name        = each.value.name
  role_arn    = each.value.role_arn
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags

  dynamic "knowledge_base_configuration" {
    for_each = each.value.knowledge_base_configuration != null ? each.value.knowledge_base_configuration : []
    content {
      type = knowledge_base_configuration.value.type

      dynamic "kendra_knowledge_base_configuration" {
        for_each = knowledge_base_configuration.value.kendra_knowledge_base_configuration != null ? knowledge_base_configuration.value.kendra_knowledge_base_configuration : []
        content {
          kendra_index_arn = kendra_knowledge_base_configuration.value.kendra_index_arn
        }
      }

      dynamic "managed_knowledge_base_configuration" {
        for_each = knowledge_base_configuration.value.managed_knowledge_base_configuration != null ? knowledge_base_configuration.value.managed_knowledge_base_configuration : []
        content {
          embedding_model_arn  = managed_knowledge_base_configuration.value.embedding_model_arn
          embedding_model_type = managed_knowledge_base_configuration.value.embedding_model_type

          dynamic "embedding_model_configuration" {
            for_each = managed_knowledge_base_configuration.value.embedding_model_configuration != null ? managed_knowledge_base_configuration.value.embedding_model_configuration : []
            content {

              dynamic "bedrock_embedding_model_configuration" {
                for_each = embedding_model_configuration.value.bedrock_embedding_model_configuration != null ? embedding_model_configuration.value.bedrock_embedding_model_configuration : []
                content {
                  dimensions          = bedrock_embedding_model_configuration.value.dimensions
                  embedding_data_type = bedrock_embedding_model_configuration.value.embedding_data_type

                  dynamic "audio" {
                    for_each = bedrock_embedding_model_configuration.value.audio != null ? bedrock_embedding_model_configuration.value.audio : []
                    content {

                      dynamic "segmentation_configuration" {
                        for_each = audio.value.segmentation_configuration != null ? audio.value.segmentation_configuration : []
                        content {
                          fixed_length_duration = segmentation_configuration.value.fixed_length_duration
                        }
                      }
                    }
                  }

                  dynamic "video" {
                    for_each = bedrock_embedding_model_configuration.value.video != null ? bedrock_embedding_model_configuration.value.video : []
                    content {

                      dynamic "segmentation_configuration" {
                        for_each = video.value.segmentation_configuration != null ? video.value.segmentation_configuration : []
                        content {
                          fixed_length_duration = segmentation_configuration.value.fixed_length_duration
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "server_side_encryption_configuration" {
            for_each = managed_knowledge_base_configuration.value.server_side_encryption_configuration != null ? managed_knowledge_base_configuration.value.server_side_encryption_configuration : []
            content {
              kms_key_arn = server_side_encryption_configuration.value.kms_key_arn
            }
          }
        }
      }

      dynamic "sql_knowledge_base_configuration" {
        for_each = knowledge_base_configuration.value.sql_knowledge_base_configuration != null ? knowledge_base_configuration.value.sql_knowledge_base_configuration : []
        content {
          type = sql_knowledge_base_configuration.value.type

          dynamic "redshift_configuration" {
            for_each = sql_knowledge_base_configuration.value.redshift_configuration != null ? sql_knowledge_base_configuration.value.redshift_configuration : []
            content {

              dynamic "query_engine_configuration" {
                for_each = redshift_configuration.value.query_engine_configuration != null ? redshift_configuration.value.query_engine_configuration : []
                content {
                  type = query_engine_configuration.value.type

                  dynamic "provisioned_configuration" {
                    for_each = query_engine_configuration.value.provisioned_configuration != null ? query_engine_configuration.value.provisioned_configuration : []
                    content {
                      cluster_identifier = provisioned_configuration.value.cluster_identifier

                      dynamic "auth_configuration" {
                        for_each = provisioned_configuration.value.auth_configuration != null ? provisioned_configuration.value.auth_configuration : []
                        content {
                          type                         = auth_configuration.value.type
                          database_user                = auth_configuration.value.database_user
                          username_password_secret_arn = auth_configuration.value.username_password_secret_arn
                        }
                      }
                    }
                  }

                  dynamic "serverless_configuration" {
                    for_each = query_engine_configuration.value.serverless_configuration != null ? query_engine_configuration.value.serverless_configuration : []
                    content {
                      workgroup_arn = serverless_configuration.value.workgroup_arn

                      dynamic "auth_configuration" {
                        for_each = serverless_configuration.value.auth_configuration != null ? serverless_configuration.value.auth_configuration : []
                        content {
                          type                         = auth_configuration.value.type
                          username_password_secret_arn = auth_configuration.value.username_password_secret_arn
                        }
                      }
                    }
                  }
                }
              }

              dynamic "query_generation_configuration" {
                for_each = redshift_configuration.value.query_generation_configuration != null ? redshift_configuration.value.query_generation_configuration : []
                content {
                  execution_timeout_seconds = query_generation_configuration.value.execution_timeout_seconds

                  dynamic "generation_context" {
                    for_each = query_generation_configuration.value.generation_context != null ? query_generation_configuration.value.generation_context : []
                    content {

                      dynamic "curated_query" {
                        for_each = generation_context.value.curated_query != null ? generation_context.value.curated_query : []
                        content {
                          natural_language = curated_query.value.natural_language
                          sql              = curated_query.value.sql
                        }
                      }

                      dynamic "table" {
                        for_each = generation_context.value.table != null ? generation_context.value.table : []
                        content {
                          name        = table.value.name
                          description = table.value.description
                          inclusion   = table.value.inclusion

                          dynamic "column" {
                            for_each = table.value.column != null ? table.value.column : []
                            content {
                              description = column.value.description
                              inclusion   = column.value.inclusion
                              name        = column.value.name
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              dynamic "storage_configuration" {
                for_each = redshift_configuration.value.storage_configuration != null ? redshift_configuration.value.storage_configuration : []
                content {
                  type = storage_configuration.value.type

                  dynamic "aws_data_catalog_configuration" {
                    for_each = storage_configuration.value.aws_data_catalog_configuration != null ? storage_configuration.value.aws_data_catalog_configuration : []
                    content {
                      table_names = aws_data_catalog_configuration.value.table_names
                    }
                  }

                  dynamic "redshift_configuration" {
                    for_each = storage_configuration.value.redshift_configuration != null ? storage_configuration.value.redshift_configuration : []
                    content {
                      database_name = redshift_configuration.value.database_name
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "vector_knowledge_base_configuration" {
        for_each = knowledge_base_configuration.value.vector_knowledge_base_configuration != null ? knowledge_base_configuration.value.vector_knowledge_base_configuration : []
        content {
          embedding_model_arn = vector_knowledge_base_configuration.value.embedding_model_arn

          dynamic "embedding_model_configuration" {
            for_each = vector_knowledge_base_configuration.value.embedding_model_configuration != null ? vector_knowledge_base_configuration.value.embedding_model_configuration : []
            content {

              dynamic "bedrock_embedding_model_configuration" {
                for_each = embedding_model_configuration.value.bedrock_embedding_model_configuration != null ? embedding_model_configuration.value.bedrock_embedding_model_configuration : []
                content {
                  dimensions          = bedrock_embedding_model_configuration.value.dimensions
                  embedding_data_type = bedrock_embedding_model_configuration.value.embedding_data_type

                  dynamic "audio" {
                    for_each = bedrock_embedding_model_configuration.value.audio != null ? bedrock_embedding_model_configuration.value.audio : []
                    content {

                      dynamic "segmentation_configuration" {
                        for_each = audio.value.segmentation_configuration != null ? audio.value.segmentation_configuration : []
                        content {
                          fixed_length_duration = segmentation_configuration.value.fixed_length_duration
                        }
                      }
                    }
                  }

                  dynamic "video" {
                    for_each = bedrock_embedding_model_configuration.value.video != null ? bedrock_embedding_model_configuration.value.video : []
                    content {

                      dynamic "segmentation_configuration" {
                        for_each = video.value.segmentation_configuration != null ? video.value.segmentation_configuration : []
                        content {
                          fixed_length_duration = segmentation_configuration.value.fixed_length_duration
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "supplemental_data_storage_configuration" {
            for_each = vector_knowledge_base_configuration.value.supplemental_data_storage_configuration != null ? vector_knowledge_base_configuration.value.supplemental_data_storage_configuration : []
            content {

              dynamic "storage_location" {
                for_each = supplemental_data_storage_configuration.value.storage_location != null ? supplemental_data_storage_configuration.value.storage_location : []
                content {
                  type = storage_location.value.type

                  dynamic "s3_location" {
                    for_each = storage_location.value.s3_location != null ? storage_location.value.s3_location : []
                    content {
                      uri = s3_location.value.uri
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "storage_configuration" {
    for_each = each.value.storage_configuration != null ? each.value.storage_configuration : []
    content {
      type = storage_configuration.value.type

      dynamic "mongo_db_atlas_configuration" {
        for_each = storage_configuration.value.mongo_db_atlas_configuration != null ? storage_configuration.value.mongo_db_atlas_configuration : []
        content {
          collection_name        = mongo_db_atlas_configuration.value.collection_name
          credentials_secret_arn = mongo_db_atlas_configuration.value.credentials_secret_arn
          database_name          = mongo_db_atlas_configuration.value.database_name
          endpoint               = mongo_db_atlas_configuration.value.endpoint
          vector_index_name      = mongo_db_atlas_configuration.value.vector_index_name
          endpoint_service_name  = mongo_db_atlas_configuration.value.endpoint_service_name
          text_index_name        = mongo_db_atlas_configuration.value.text_index_name

          dynamic "field_mapping" {
            for_each = mongo_db_atlas_configuration.value.field_mapping != null ? mongo_db_atlas_configuration.value.field_mapping : []
            content {
              metadata_field = field_mapping.value.metadata_field
              text_field     = field_mapping.value.text_field
              vector_field   = field_mapping.value.vector_field
            }
          }
        }
      }

      dynamic "neptune_analytics_configuration" {
        for_each = storage_configuration.value.neptune_analytics_configuration != null ? storage_configuration.value.neptune_analytics_configuration : []
        content {
          graph_arn = neptune_analytics_configuration.value.graph_arn

          dynamic "field_mapping" {
            for_each = neptune_analytics_configuration.value.field_mapping != null ? neptune_analytics_configuration.value.field_mapping : []
            content {
              metadata_field = field_mapping.value.metadata_field
              text_field     = field_mapping.value.text_field
            }
          }
        }
      }

      dynamic "opensearch_managed_cluster_configuration" {
        for_each = storage_configuration.value.opensearch_managed_cluster_configuration != null ? storage_configuration.value.opensearch_managed_cluster_configuration : []
        content {
          domain_arn        = opensearch_managed_cluster_configuration.value.domain_arn
          domain_endpoint   = opensearch_managed_cluster_configuration.value.domain_endpoint
          vector_index_name = opensearch_managed_cluster_configuration.value.vector_index_name

          dynamic "field_mapping" {
            for_each = opensearch_managed_cluster_configuration.value.field_mapping != null ? opensearch_managed_cluster_configuration.value.field_mapping : []
            content {
              metadata_field = field_mapping.value.metadata_field
              text_field     = field_mapping.value.text_field
              vector_field   = field_mapping.value.vector_field
            }
          }
        }
      }

      dynamic "opensearch_serverless_configuration" {
        for_each = storage_configuration.value.opensearch_serverless_configuration != null ? storage_configuration.value.opensearch_serverless_configuration : []
        content {
          collection_arn    = opensearch_serverless_configuration.value.collection_arn
          vector_index_name = opensearch_serverless_configuration.value.vector_index_name

          dynamic "field_mapping" {
            for_each = opensearch_serverless_configuration.value.field_mapping != null ? opensearch_serverless_configuration.value.field_mapping : []
            content {
              metadata_field = field_mapping.value.metadata_field
              text_field     = field_mapping.value.text_field
              vector_field   = field_mapping.value.vector_field
            }
          }
        }
      }

      dynamic "pinecone_configuration" {
        for_each = storage_configuration.value.pinecone_configuration != null ? storage_configuration.value.pinecone_configuration : []
        content {
          connection_string      = pinecone_configuration.value.connection_string
          credentials_secret_arn = pinecone_configuration.value.credentials_secret_arn
          namespace              = pinecone_configuration.value.namespace

          dynamic "field_mapping" {
            for_each = pinecone_configuration.value.field_mapping != null ? pinecone_configuration.value.field_mapping : []
            content {
              metadata_field = field_mapping.value.metadata_field
              text_field     = field_mapping.value.text_field
            }
          }
        }
      }

      dynamic "rds_configuration" {
        for_each = storage_configuration.value.rds_configuration != null ? storage_configuration.value.rds_configuration : []
        content {
          credentials_secret_arn = rds_configuration.value.credentials_secret_arn
          database_name          = rds_configuration.value.database_name
          resource_arn           = rds_configuration.value.resource_arn
          table_name             = rds_configuration.value.table_name

          dynamic "field_mapping" {
            for_each = rds_configuration.value.field_mapping != null ? rds_configuration.value.field_mapping : []
            content {
              metadata_field        = field_mapping.value.metadata_field
              primary_key_field     = field_mapping.value.primary_key_field
              text_field            = field_mapping.value.text_field
              vector_field          = field_mapping.value.vector_field
              custom_metadata_field = field_mapping.value.custom_metadata_field
            }
          }
        }
      }

      dynamic "redis_enterprise_cloud_configuration" {
        for_each = storage_configuration.value.redis_enterprise_cloud_configuration != null ? storage_configuration.value.redis_enterprise_cloud_configuration : []
        content {
          credentials_secret_arn = redis_enterprise_cloud_configuration.value.credentials_secret_arn
          endpoint               = redis_enterprise_cloud_configuration.value.endpoint
          vector_index_name      = redis_enterprise_cloud_configuration.value.vector_index_name

          dynamic "field_mapping" {
            for_each = redis_enterprise_cloud_configuration.value.field_mapping != null ? redis_enterprise_cloud_configuration.value.field_mapping : []
            content {
              metadata_field = field_mapping.value.metadata_field
              text_field     = field_mapping.value.text_field
              vector_field   = field_mapping.value.vector_field
            }
          }
        }
      }

      dynamic "s3_vectors_configuration" {
        for_each = storage_configuration.value.s3_vectors_configuration != null ? storage_configuration.value.s3_vectors_configuration : []
        content {
          index_arn         = s3_vectors_configuration.value.index_arn
          index_name        = s3_vectors_configuration.value.index_name
          vector_bucket_arn = s3_vectors_configuration.value.vector_bucket_arn
        }
      }
    }
  }
}
