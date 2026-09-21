resource "aws_bedrockagentcore_evaluator" "bedrockagentcore_evaluators" {
  for_each = var.bedrockagentcore_evaluators

  evaluator_name = each.value.evaluator_name
  level          = each.value.level
  description    = each.value.description
  kms_key_arn    = each.value.kms_key_arn
  region         = each.value.region
  tags           = each.value.tags

  dynamic "evaluator_config" {
    for_each = each.value.evaluator_config != null ? each.value.evaluator_config : []
    content {

      dynamic "code_based" {
        for_each = evaluator_config.value.code_based != null ? evaluator_config.value.code_based : []
        content {

          dynamic "lambda_config" {
            for_each = code_based.value.lambda_config != null ? code_based.value.lambda_config : []
            content {
              lambda_arn                = lambda_config.value.lambda_arn
              lambda_timeout_in_seconds = lambda_config.value.lambda_timeout_in_seconds
            }
          }
        }
      }

      dynamic "llm_as_a_judge" {
        for_each = evaluator_config.value.llm_as_a_judge != null ? evaluator_config.value.llm_as_a_judge : []
        content {
          instructions = llm_as_a_judge.value.instructions

          dynamic "model_config" {
            for_each = llm_as_a_judge.value.model_config != null ? llm_as_a_judge.value.model_config : []
            content {

              dynamic "bedrock_evaluator_model_config" {
                for_each = model_config.value.bedrock_evaluator_model_config != null ? model_config.value.bedrock_evaluator_model_config : []
                content {
                  model_id                        = bedrock_evaluator_model_config.value.model_id
                  additional_model_request_fields = bedrock_evaluator_model_config.value.additional_model_request_fields

                  dynamic "inference_config" {
                    for_each = bedrock_evaluator_model_config.value.inference_config != null ? bedrock_evaluator_model_config.value.inference_config : []
                    content {
                      max_tokens     = inference_config.value.max_tokens
                      stop_sequences = inference_config.value.stop_sequences
                      temperature    = inference_config.value.temperature
                      top_p          = inference_config.value.top_p
                    }
                  }
                }
              }
            }
          }

          dynamic "rating_scale" {
            for_each = llm_as_a_judge.value.rating_scale != null ? llm_as_a_judge.value.rating_scale : []
            content {

              dynamic "categorical" {
                for_each = rating_scale.value.categorical != null ? rating_scale.value.categorical : []
                content {
                  definition = categorical.value.definition
                  label      = categorical.value.label
                }
              }

              dynamic "numerical" {
                for_each = rating_scale.value.numerical != null ? rating_scale.value.numerical : []
                content {
                  definition = numerical.value.definition
                  label      = numerical.value.label
                  value      = numerical.value.value
                }
              }
            }
          }
        }
      }
    }
  }
}
