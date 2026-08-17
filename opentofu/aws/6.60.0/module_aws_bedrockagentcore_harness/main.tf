resource "aws_bedrockagentcore_harness" "bedrockagentcore_harnesses" {
  for_each = var.bedrockagentcore_harnesses

  execution_role_arn    = each.value.execution_role_arn
  harness_name          = each.value.harness_name
  allowed_tools         = each.value.allowed_tools
  environment           = each.value.environment
  environment_variables = each.value.environment_variables
  max_iterations        = each.value.max_iterations
  max_tokens            = each.value.max_tokens
  region                = each.value.region
  tags                  = each.value.tags
  timeout_seconds       = each.value.timeout_seconds
  truncation            = each.value.truncation

  dynamic "authorizer_configuration" {
    for_each = each.value.authorizer_configuration != null ? each.value.authorizer_configuration : []
    content {

      dynamic "custom_jwt_authorizer" {
        for_each = authorizer_configuration.value.custom_jwt_authorizer != null ? authorizer_configuration.value.custom_jwt_authorizer : []
        content {
          discovery_url    = custom_jwt_authorizer.value.discovery_url
          allowed_audience = custom_jwt_authorizer.value.allowed_audience
          allowed_clients  = custom_jwt_authorizer.value.allowed_clients
          allowed_scopes   = custom_jwt_authorizer.value.allowed_scopes

          dynamic "allowed_workload_configuration" {
            for_each = custom_jwt_authorizer.value.allowed_workload_configuration != null ? custom_jwt_authorizer.value.allowed_workload_configuration : []
            content {
              workload_identities = allowed_workload_configuration.value.workload_identities

              dynamic "hosting_environment" {
                for_each = allowed_workload_configuration.value.hosting_environment != null ? allowed_workload_configuration.value.hosting_environment : []
                content {
                  arn = hosting_environment.value.arn
                }
              }
            }
          }

          dynamic "custom_claim" {
            for_each = custom_jwt_authorizer.value.custom_claim != null ? custom_jwt_authorizer.value.custom_claim : []
            content {
              inbound_token_claim_name       = custom_claim.value.inbound_token_claim_name
              inbound_token_claim_value_type = custom_claim.value.inbound_token_claim_value_type

              dynamic "authorizing_claim_match_value" {
                for_each = custom_claim.value.authorizing_claim_match_value != null ? custom_claim.value.authorizing_claim_match_value : []
                content {
                  claim_match_operator = authorizing_claim_match_value.value.claim_match_operator

                  dynamic "claim_match_value" {
                    for_each = authorizing_claim_match_value.value.claim_match_value != null ? authorizing_claim_match_value.value.claim_match_value : []
                    content {
                      match_value_string      = claim_match_value.value.match_value_string
                      match_value_string_list = claim_match_value.value.match_value_string_list
                    }
                  }
                }
              }
            }
          }

          dynamic "private_endpoint" {
            for_each = custom_jwt_authorizer.value.private_endpoint != null ? custom_jwt_authorizer.value.private_endpoint : []
            content {

              dynamic "managed_vpc_resource" {
                for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                content {
                  endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                  subnet_ids               = managed_vpc_resource.value.subnet_ids
                  vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                  routing_domain           = managed_vpc_resource.value.routing_domain
                  security_group_ids       = managed_vpc_resource.value.security_group_ids
                  tags                     = managed_vpc_resource.value.tags
                }
              }

              dynamic "self_managed_lattice_resource" {
                for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                content {
                  resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
                }
              }
            }
          }

          dynamic "private_endpoint_overrides" {
            for_each = custom_jwt_authorizer.value.private_endpoint_overrides != null ? custom_jwt_authorizer.value.private_endpoint_overrides : []
            content {
              domain = private_endpoint_overrides.value.domain

              dynamic "private_endpoint" {
                for_each = private_endpoint_overrides.value.private_endpoint != null ? private_endpoint_overrides.value.private_endpoint : []
                content {

                  dynamic "managed_vpc_resource" {
                    for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                    content {
                      endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                      subnet_ids               = managed_vpc_resource.value.subnet_ids
                      vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                      routing_domain           = managed_vpc_resource.value.routing_domain
                      security_group_ids       = managed_vpc_resource.value.security_group_ids
                      tags                     = managed_vpc_resource.value.tags
                    }
                  }

                  dynamic "self_managed_lattice_resource" {
                    for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                    content {
                      resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
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

  dynamic "environment_artifact" {
    for_each = each.value.environment_artifact != null ? each.value.environment_artifact : []
    content {

      dynamic "container_configuration" {
        for_each = environment_artifact.value.container_configuration != null ? environment_artifact.value.container_configuration : []
        content {
          container_uri = container_configuration.value.container_uri
        }
      }
    }
  }

  dynamic "memory" {
    for_each = each.value.memory != null ? each.value.memory : []
    content {

      dynamic "agentcore_memory_configuration" {
        for_each = memory.value.agentcore_memory_configuration != null ? memory.value.agentcore_memory_configuration : []
        content {
          arn            = agentcore_memory_configuration.value.arn
          actor_id       = agentcore_memory_configuration.value.actor_id
          messages_count = agentcore_memory_configuration.value.messages_count

          dynamic "retrieval_config" {
            for_each = agentcore_memory_configuration.value.retrieval_config != null ? agentcore_memory_configuration.value.retrieval_config : []
            content {
              map_block_key   = retrieval_config.value.map_block_key
              relevance_score = retrieval_config.value.relevance_score
              strategy_id     = retrieval_config.value.strategy_id
              top_k           = retrieval_config.value.top_k
            }
          }
        }
      }

      dynamic "disabled" {
        for_each = memory.value.disabled != null ? memory.value.disabled : []
        content {
        }
      }

      dynamic "managed_memory_configuration" {
        for_each = memory.value.managed_memory_configuration != null ? memory.value.managed_memory_configuration : []
        content {
          encryption_key_arn    = managed_memory_configuration.value.encryption_key_arn
          event_expiry_duration = managed_memory_configuration.value.event_expiry_duration
          strategies            = managed_memory_configuration.value.strategies
        }
      }
    }
  }

  dynamic "model" {
    for_each = each.value.model != null ? each.value.model : []
    content {

      dynamic "bedrock_model_config" {
        for_each = model.value.bedrock_model_config != null ? model.value.bedrock_model_config : []
        content {
          model_id    = bedrock_model_config.value.model_id
          max_tokens  = bedrock_model_config.value.max_tokens
          temperature = bedrock_model_config.value.temperature
          top_p       = bedrock_model_config.value.top_p
        }
      }

      dynamic "gemini_model_config" {
        for_each = model.value.gemini_model_config != null ? model.value.gemini_model_config : []
        content {
          api_key_arn = gemini_model_config.value.api_key_arn
          model_id    = gemini_model_config.value.model_id
          max_tokens  = gemini_model_config.value.max_tokens
          temperature = gemini_model_config.value.temperature
          top_k       = gemini_model_config.value.top_k
          top_p       = gemini_model_config.value.top_p
        }
      }

      dynamic "openai_model_config" {
        for_each = model.value.openai_model_config != null ? model.value.openai_model_config : []
        content {
          api_key_arn = openai_model_config.value.api_key_arn
          model_id    = openai_model_config.value.model_id
          max_tokens  = openai_model_config.value.max_tokens
          temperature = openai_model_config.value.temperature
          top_p       = openai_model_config.value.top_p
        }
      }
    }
  }

  dynamic "skill" {
    for_each = each.value.skill != null ? each.value.skill : []
    content {
      path = skill.value.path
    }
  }

  dynamic "system_prompt" {
    for_each = each.value.system_prompt != null ? each.value.system_prompt : []
    content {
      text = system_prompt.value.text
    }
  }

  dynamic "tool" {
    for_each = each.value.tool != null ? each.value.tool : []
    content {
      type = tool.value.type
      name = tool.value.name

      dynamic "config" {
        for_each = tool.value.config != null ? tool.value.config : []
        content {

          dynamic "agentcore_browser" {
            for_each = config.value.agentcore_browser != null ? config.value.agentcore_browser : []
            content {
              browser_arn = agentcore_browser.value.browser_arn
            }
          }

          dynamic "agentcore_code_interpreter" {
            for_each = config.value.agentcore_code_interpreter != null ? config.value.agentcore_code_interpreter : []
            content {
              code_interpreter_arn = agentcore_code_interpreter.value.code_interpreter_arn
            }
          }

          dynamic "agentcore_gateway" {
            for_each = config.value.agentcore_gateway != null ? config.value.agentcore_gateway : []
            content {
              gateway_arn = agentcore_gateway.value.gateway_arn

              dynamic "outbound_auth" {
                for_each = agentcore_gateway.value.outbound_auth != null ? agentcore_gateway.value.outbound_auth : []
                content {
                  aws_iam = outbound_auth.value.aws_iam
                  none    = outbound_auth.value.none

                  dynamic "oauth" {
                    for_each = outbound_auth.value.oauth != null ? outbound_auth.value.oauth : []
                    content {
                      provider_arn       = oauth.value.provider_arn
                      scopes             = oauth.value.scopes
                      custom_parameters  = oauth.value.custom_parameters
                      default_return_url = oauth.value.default_return_url
                      grant_type         = oauth.value.grant_type
                    }
                  }
                }
              }
            }
          }

          dynamic "inline_function" {
            for_each = config.value.inline_function != null ? config.value.inline_function : []
            content {
              description  = inline_function.value.description
              input_schema = inline_function.value.input_schema
            }
          }

          dynamic "remote_mcp" {
            for_each = config.value.remote_mcp != null ? config.value.remote_mcp : []
            content {
              url     = remote_mcp.value.url
              headers = remote_mcp.value.headers
            }
          }
        }
      }
    }
  }
}
