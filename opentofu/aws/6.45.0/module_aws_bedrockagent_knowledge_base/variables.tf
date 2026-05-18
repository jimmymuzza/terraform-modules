variable "bedrockagent_knowledge_bases" {
  description = <<EOT
Map of bedrockagent_knowledge_bases, attributes below
Required:
    - name
    - role_arn
Optional:
    - description
    - region
    - tags
    - knowledge_base_configuration
    - storage_configuration
EOT

  type = map(object({
    name                         = string
    role_arn                     = string
    description                  = optional(string)
    region                       = optional(string)
    tags                         = optional(map(string))
    knowledge_base_configuration = optional(list(object({
            type                                = string
            kendra_knowledge_base_configuration = optional(list(object({
                kendra_index_arn = string
            })))
            sql_knowledge_base_configuration    = optional(list(object({
                type                   = string
                redshift_configuration = optional(list(object({
                    query_engine_configuration     = optional(list(object({
                        type                      = string
                        provisioned_configuration = optional(list(object({
                            cluster_identifier = string
                            auth_configuration = optional(list(object({
                                type                         = string
                                database_user                = optional(string)
                                username_password_secret_arn = optional(string)
                            })))
                        })))
                        serverless_configuration  = optional(list(object({
                            workgroup_arn      = string
                            auth_configuration = optional(list(object({
                                type                         = string
                                username_password_secret_arn = optional(string)
                            })))
                        })))
                    })))
                    query_generation_configuration = optional(list(object({
                        execution_timeout_seconds = optional(number)
                        generation_context        = optional(list(object({
                            curated_query = optional(list(object({
                                natural_language = string
                                sql              = string
                            })))
                            table         = optional(list(object({
                                name        = string
                                description = optional(string)
                                inclusion   = optional(string)
                                column      = optional(list(object({
                                    description = optional(string)
                                    inclusion   = optional(string)
                                    name        = optional(string)
                                })))
                            })))
                        })))
                    })))
                    storage_configuration          = optional(list(object({
                        type                           = string
                        aws_data_catalog_configuration = optional(list(object({
                            table_names = set(string)
                        })))
                        redshift_configuration         = optional(list(object({
                            database_name = string
                        })))
                    })))
                })))
            })))
            vector_knowledge_base_configuration = optional(list(object({
                embedding_model_arn                     = string
                embedding_model_configuration           = optional(list(object({
                    bedrock_embedding_model_configuration = optional(list(object({
                        dimensions          = optional(number)
                        embedding_data_type = optional(string)
                    })))
                })))
                supplemental_data_storage_configuration = optional(list(object({
                    storage_location = optional(list(object({
                        type        = string
                        s3_location = optional(list(object({
                            uri = string
                        })))
                    })))
                })))
            })))
        })))
    storage_configuration        = optional(list(object({
            type                                     = string
            mongo_db_atlas_configuration             = optional(list(object({
                collection_name        = string
                credentials_secret_arn = string
                database_name          = string
                endpoint               = string
                vector_index_name      = string
                endpoint_service_name  = optional(string)
                text_index_name        = optional(string)
                field_mapping          = optional(list(object({
                    metadata_field = string
                    text_field     = string
                    vector_field   = string
                })))
            })))
            neptune_analytics_configuration          = optional(list(object({
                graph_arn     = string
                field_mapping = optional(list(object({
                    metadata_field = string
                    text_field     = string
                })))
            })))
            opensearch_managed_cluster_configuration = optional(list(object({
                domain_arn        = string
                domain_endpoint   = string
                vector_index_name = string
                field_mapping     = optional(list(object({
                    metadata_field = string
                    text_field     = string
                    vector_field   = string
                })))
            })))
            opensearch_serverless_configuration      = optional(list(object({
                collection_arn    = string
                vector_index_name = string
                field_mapping     = optional(list(object({
                    metadata_field = string
                    text_field     = string
                    vector_field   = string
                })))
            })))
            pinecone_configuration                   = optional(list(object({
                connection_string      = string
                credentials_secret_arn = string
                namespace              = optional(string)
                field_mapping          = optional(list(object({
                    metadata_field = string
                    text_field     = string
                })))
            })))
            rds_configuration                        = optional(list(object({
                credentials_secret_arn = string
                database_name          = string
                resource_arn           = string
                table_name             = string
                field_mapping          = optional(list(object({
                    metadata_field        = string
                    primary_key_field     = string
                    text_field            = string
                    vector_field          = string
                    custom_metadata_field = optional(string)
                })))
            })))
            redis_enterprise_cloud_configuration     = optional(list(object({
                credentials_secret_arn = string
                endpoint               = string
                vector_index_name      = string
                field_mapping          = optional(list(object({
                    metadata_field = optional(string)
                    text_field     = optional(string)
                    vector_field   = optional(string)
                })))
            })))
            s3_vectors_configuration                 = optional(list(object({
                index_arn         = optional(string)
                index_name        = optional(string)
                vector_bucket_arn = optional(string)
            })))
        })))
  }))
}
