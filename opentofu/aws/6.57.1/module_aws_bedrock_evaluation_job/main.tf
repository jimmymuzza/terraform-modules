resource "aws_bedrock_evaluation_job" "bedrock_evaluation_jobs" {
  for_each = var.bedrock_evaluation_jobs

  job_name                   = each.value.job_name
  role_arn                   = each.value.role_arn
  application_type           = each.value.application_type
  customer_encryption_key_id = each.value.customer_encryption_key_id
  job_description            = each.value.job_description
  region                     = each.value.region
  skip_destroy               = each.value.skip_destroy
  tags                       = each.value.tags

  dynamic "evaluation_config" {
    for_each = each.value.evaluation_config != null ? each.value.evaluation_config : []
    content {

      dynamic "automated" {
        for_each = evaluation_config.value.automated != null ? evaluation_config.value.automated : []
        content {

          dynamic "custom_metric_config" {
            for_each = automated.value.custom_metric_config != null ? automated.value.custom_metric_config : []
            content {

              dynamic "custom_metric" {
                for_each = custom_metric_config.value.custom_metric != null ? custom_metric_config.value.custom_metric : []
                content {

                  dynamic "custom_metric_definition" {
                    for_each = custom_metric.value.custom_metric_definition != null ? custom_metric.value.custom_metric_definition : []
                    content {
                      instructions = custom_metric_definition.value.instructions
                      name         = custom_metric_definition.value.name

                      dynamic "rating_scale" {
                        for_each = custom_metric_definition.value.rating_scale != null ? custom_metric_definition.value.rating_scale : []
                        content {
                          definition = rating_scale.value.definition

                          dynamic "value" {
                            for_each = rating_scale.value.value != null ? rating_scale.value.value : []
                            content {
                              float_value  = value.value.float_value
                              string_value = value.value.string_value
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              dynamic "evaluator_model_config" {
                for_each = custom_metric_config.value.evaluator_model_config != null ? custom_metric_config.value.evaluator_model_config : []
                content {

                  dynamic "bedrock_evaluator_model" {
                    for_each = evaluator_model_config.value.bedrock_evaluator_model != null ? evaluator_model_config.value.bedrock_evaluator_model : []
                    content {
                      model_identifier = bedrock_evaluator_model.value.model_identifier
                    }
                  }
                }
              }
            }
          }

          dynamic "dataset_metric_config" {
            for_each = automated.value.dataset_metric_config != null ? automated.value.dataset_metric_config : []
            content {
              metric_names = dataset_metric_config.value.metric_names
              task_type    = dataset_metric_config.value.task_type

              dynamic "dataset" {
                for_each = dataset_metric_config.value.dataset != null ? dataset_metric_config.value.dataset : []
                content {
                  name = dataset.value.name

                  dynamic "dataset_location" {
                    for_each = dataset.value.dataset_location != null ? dataset.value.dataset_location : []
                    content {
                      s3_uri = dataset_location.value.s3_uri
                    }
                  }
                }
              }
            }
          }

          dynamic "evaluator_model_config" {
            for_each = automated.value.evaluator_model_config != null ? automated.value.evaluator_model_config : []
            content {

              dynamic "bedrock_evaluator_model" {
                for_each = evaluator_model_config.value.bedrock_evaluator_model != null ? evaluator_model_config.value.bedrock_evaluator_model : []
                content {
                  model_identifier = bedrock_evaluator_model.value.model_identifier
                }
              }
            }
          }
        }
      }

      dynamic "human" {
        for_each = evaluation_config.value.human != null ? evaluation_config.value.human : []
        content {

          dynamic "custom_metric" {
            for_each = human.value.custom_metric != null ? human.value.custom_metric : []
            content {
              name          = custom_metric.value.name
              rating_method = custom_metric.value.rating_method
              description   = custom_metric.value.description
            }
          }

          dynamic "dataset_metric_config" {
            for_each = human.value.dataset_metric_config != null ? human.value.dataset_metric_config : []
            content {
              metric_names = dataset_metric_config.value.metric_names
              task_type    = dataset_metric_config.value.task_type

              dynamic "dataset" {
                for_each = dataset_metric_config.value.dataset != null ? dataset_metric_config.value.dataset : []
                content {
                  name = dataset.value.name

                  dynamic "dataset_location" {
                    for_each = dataset.value.dataset_location != null ? dataset.value.dataset_location : []
                    content {
                      s3_uri = dataset_location.value.s3_uri
                    }
                  }
                }
              }
            }
          }

          dynamic "human_workflow_config" {
            for_each = human.value.human_workflow_config != null ? human.value.human_workflow_config : []
            content {
              flow_definition_arn = human_workflow_config.value.flow_definition_arn
              instructions        = human_workflow_config.value.instructions
            }
          }
        }
      }
    }
  }

  dynamic "inference_config" {
    for_each = each.value.inference_config != null ? each.value.inference_config : []
    content {

      dynamic "model" {
        for_each = inference_config.value.model != null ? inference_config.value.model : []
        content {

          dynamic "bedrock_model" {
            for_each = model.value.bedrock_model != null ? model.value.bedrock_model : []
            content {
              model_identifier = bedrock_model.value.model_identifier
              inference_params = bedrock_model.value.inference_params

              dynamic "performance_config" {
                for_each = bedrock_model.value.performance_config != null ? bedrock_model.value.performance_config : []
                content {
                  latency = performance_config.value.latency
                }
              }
            }
          }

          dynamic "precomputed_inference_source" {
            for_each = model.value.precomputed_inference_source != null ? model.value.precomputed_inference_source : []
            content {
              inference_source_identifier = precomputed_inference_source.value.inference_source_identifier
            }
          }
        }
      }

      dynamic "rag_config" {
        for_each = inference_config.value.rag_config != null ? inference_config.value.rag_config : []
        content {

          dynamic "knowledge_base_config" {
            for_each = rag_config.value.knowledge_base_config != null ? rag_config.value.knowledge_base_config : []
            content {

              dynamic "retrieve_and_generate_config" {
                for_each = knowledge_base_config.value.retrieve_and_generate_config != null ? knowledge_base_config.value.retrieve_and_generate_config : []
                content {
                  knowledge_base_id = retrieve_and_generate_config.value.knowledge_base_id
                  model_arn         = retrieve_and_generate_config.value.model_arn

                  dynamic "retrieval_configuration" {
                    for_each = retrieve_and_generate_config.value.retrieval_configuration != null ? retrieve_and_generate_config.value.retrieval_configuration : []
                    content {

                      dynamic "vector_search_configuration" {
                        for_each = retrieval_configuration.value.vector_search_configuration != null ? retrieval_configuration.value.vector_search_configuration : []
                        content {
                          number_of_results = vector_search_configuration.value.number_of_results
                        }
                      }
                    }
                  }
                }
              }

              dynamic "retrieve_config" {
                for_each = knowledge_base_config.value.retrieve_config != null ? knowledge_base_config.value.retrieve_config : []
                content {
                  knowledge_base_id = retrieve_config.value.knowledge_base_id

                  dynamic "knowledge_base_retrieval_configuration" {
                    for_each = retrieve_config.value.knowledge_base_retrieval_configuration != null ? retrieve_config.value.knowledge_base_retrieval_configuration : []
                    content {

                      dynamic "vector_search_configuration" {
                        for_each = knowledge_base_retrieval_configuration.value.vector_search_configuration != null ? knowledge_base_retrieval_configuration.value.vector_search_configuration : []
                        content {
                          number_of_results = vector_search_configuration.value.number_of_results
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "precomputed_rag_source_config" {
            for_each = rag_config.value.precomputed_rag_source_config != null ? rag_config.value.precomputed_rag_source_config : []
            content {

              dynamic "retrieve_and_generate_source_config" {
                for_each = precomputed_rag_source_config.value.retrieve_and_generate_source_config != null ? precomputed_rag_source_config.value.retrieve_and_generate_source_config : []
                content {
                  rag_source_identifier = retrieve_and_generate_source_config.value.rag_source_identifier
                }
              }

              dynamic "retrieve_source_config" {
                for_each = precomputed_rag_source_config.value.retrieve_source_config != null ? precomputed_rag_source_config.value.retrieve_source_config : []
                content {
                  rag_source_identifier = retrieve_source_config.value.rag_source_identifier
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "output_data_config" {
    for_each = each.value.output_data_config != null ? each.value.output_data_config : []
    content {
      s3_uri = output_data_config.value.s3_uri
    }
  }
}
