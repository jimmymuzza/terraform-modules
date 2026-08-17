resource "aws_bedrockagentcore_gateway_target" "bedrockagentcore_gateway_targets" {
  for_each = var.bedrockagentcore_gateway_targets

  gateway_identifier = each.value.gateway_identifier
  name               = each.value.name
  description        = each.value.description
  region             = each.value.region

  dynamic "credential_provider_configuration" {
    for_each = each.value.credential_provider_configuration != null ? each.value.credential_provider_configuration : []
    content {

      dynamic "api_key" {
        for_each = credential_provider_configuration.value.api_key != null ? credential_provider_configuration.value.api_key : []
        content {
          provider_arn              = api_key.value.provider_arn
          credential_location       = api_key.value.credential_location
          credential_parameter_name = api_key.value.credential_parameter_name
          credential_prefix         = api_key.value.credential_prefix
        }
      }

      dynamic "caller_iam_credentials" {
        for_each = credential_provider_configuration.value.caller_iam_credentials != null ? credential_provider_configuration.value.caller_iam_credentials : []
        content {
          service = caller_iam_credentials.value.service
          region  = caller_iam_credentials.value.region
        }
      }

      dynamic "gateway_iam_role" {
        for_each = credential_provider_configuration.value.gateway_iam_role != null ? credential_provider_configuration.value.gateway_iam_role : []
        content {
          region  = gateway_iam_role.value.region
          service = gateway_iam_role.value.service
        }
      }

      dynamic "jwt_passthrough" {
        for_each = credential_provider_configuration.value.jwt_passthrough != null ? credential_provider_configuration.value.jwt_passthrough : []
        content {
        }
      }

      dynamic "oauth" {
        for_each = credential_provider_configuration.value.oauth != null ? credential_provider_configuration.value.oauth : []
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

  dynamic "metadata_configuration" {
    for_each = each.value.metadata_configuration != null ? each.value.metadata_configuration : []
    content {
      allowed_query_parameters = metadata_configuration.value.allowed_query_parameters
      allowed_request_headers  = metadata_configuration.value.allowed_request_headers
      allowed_response_headers = metadata_configuration.value.allowed_response_headers
    }
  }

  dynamic "private_endpoint" {
    for_each = each.value.private_endpoint != null ? each.value.private_endpoint : []
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

  dynamic "target_configuration" {
    for_each = each.value.target_configuration != null ? each.value.target_configuration : []
    content {

      dynamic "http" {
        for_each = target_configuration.value.http != null ? target_configuration.value.http : []
        content {

          dynamic "agentcore_runtime" {
            for_each = http.value.agentcore_runtime != null ? http.value.agentcore_runtime : []
            content {
              arn       = agentcore_runtime.value.arn
              qualifier = agentcore_runtime.value.qualifier
            }
          }
        }
      }

      dynamic "mcp" {
        for_each = target_configuration.value.mcp != null ? target_configuration.value.mcp : []
        content {

          dynamic "api_gateway" {
            for_each = mcp.value.api_gateway != null ? mcp.value.api_gateway : []
            content {
              rest_api_id = api_gateway.value.rest_api_id
              stage       = api_gateway.value.stage

              dynamic "api_gateway_tool_configuration" {
                for_each = api_gateway.value.api_gateway_tool_configuration != null ? api_gateway.value.api_gateway_tool_configuration : []
                content {

                  dynamic "tool_filter" {
                    for_each = api_gateway_tool_configuration.value.tool_filter != null ? api_gateway_tool_configuration.value.tool_filter : []
                    content {
                      filter_path = tool_filter.value.filter_path
                      methods     = tool_filter.value.methods
                    }
                  }

                  dynamic "tool_override" {
                    for_each = api_gateway_tool_configuration.value.tool_override != null ? api_gateway_tool_configuration.value.tool_override : []
                    content {
                      method      = tool_override.value.method
                      name        = tool_override.value.name
                      path        = tool_override.value.path
                      description = tool_override.value.description
                    }
                  }
                }
              }
            }
          }

          dynamic "lambda" {
            for_each = mcp.value.lambda != null ? mcp.value.lambda : []
            content {
              lambda_arn = lambda.value.lambda_arn

              dynamic "tool_schema" {
                for_each = lambda.value.tool_schema != null ? lambda.value.tool_schema : []
                content {

                  dynamic "inline_payload" {
                    for_each = tool_schema.value.inline_payload != null ? tool_schema.value.inline_payload : []
                    content {
                      description = inline_payload.value.description
                      name        = inline_payload.value.name

                      dynamic "input_schema" {
                        for_each = inline_payload.value.input_schema != null ? inline_payload.value.input_schema : []
                        content {
                          type        = input_schema.value.type
                          description = input_schema.value.description

                          dynamic "items" {
                            for_each = input_schema.value.items != null ? input_schema.value.items : []
                            content {
                              type        = items.value.type
                              description = items.value.description

                              dynamic "items" {
                                for_each = items.value.items != null ? items.value.items : []
                                content {
                                  type            = items.value.type
                                  description     = items.value.description
                                  items_json      = items.value.items_json
                                  properties_json = items.value.properties_json
                                }
                              }

                              dynamic "property" {
                                for_each = items.value.property != null ? items.value.property : []
                                content {
                                  name            = property.value.name
                                  type            = property.value.type
                                  description     = property.value.description
                                  items_json      = property.value.items_json
                                  properties_json = property.value.properties_json
                                  required        = property.value.required
                                }
                              }
                            }
                          }

                          dynamic "property" {
                            for_each = input_schema.value.property != null ? input_schema.value.property : []
                            content {
                              name        = property.value.name
                              type        = property.value.type
                              description = property.value.description
                              required    = property.value.required

                              dynamic "items" {
                                for_each = property.value.items != null ? property.value.items : []
                                content {
                                  type        = items.value.type
                                  description = items.value.description

                                  dynamic "items" {
                                    for_each = items.value.items != null ? items.value.items : []
                                    content {
                                      type            = items.value.type
                                      description     = items.value.description
                                      items_json      = items.value.items_json
                                      properties_json = items.value.properties_json
                                    }
                                  }

                                  dynamic "property" {
                                    for_each = items.value.property != null ? items.value.property : []
                                    content {
                                      name            = property.value.name
                                      type            = property.value.type
                                      description     = property.value.description
                                      items_json      = property.value.items_json
                                      properties_json = property.value.properties_json
                                      required        = property.value.required
                                    }
                                  }
                                }
                              }

                              dynamic "property" {
                                for_each = property.value.property != null ? property.value.property : []
                                content {
                                  name            = property.value.name
                                  type            = property.value.type
                                  description     = property.value.description
                                  items_json      = property.value.items_json
                                  properties_json = property.value.properties_json
                                  required        = property.value.required
                                }
                              }
                            }
                          }
                        }
                      }

                      dynamic "output_schema" {
                        for_each = inline_payload.value.output_schema != null ? inline_payload.value.output_schema : []
                        content {
                          type        = output_schema.value.type
                          description = output_schema.value.description

                          dynamic "items" {
                            for_each = output_schema.value.items != null ? output_schema.value.items : []
                            content {
                              type        = items.value.type
                              description = items.value.description

                              dynamic "items" {
                                for_each = items.value.items != null ? items.value.items : []
                                content {
                                  type            = items.value.type
                                  description     = items.value.description
                                  items_json      = items.value.items_json
                                  properties_json = items.value.properties_json
                                }
                              }

                              dynamic "property" {
                                for_each = items.value.property != null ? items.value.property : []
                                content {
                                  name            = property.value.name
                                  type            = property.value.type
                                  description     = property.value.description
                                  items_json      = property.value.items_json
                                  properties_json = property.value.properties_json
                                  required        = property.value.required
                                }
                              }
                            }
                          }

                          dynamic "property" {
                            for_each = output_schema.value.property != null ? output_schema.value.property : []
                            content {
                              name        = property.value.name
                              type        = property.value.type
                              description = property.value.description
                              required    = property.value.required

                              dynamic "items" {
                                for_each = property.value.items != null ? property.value.items : []
                                content {
                                  type        = items.value.type
                                  description = items.value.description

                                  dynamic "items" {
                                    for_each = items.value.items != null ? items.value.items : []
                                    content {
                                      type            = items.value.type
                                      description     = items.value.description
                                      items_json      = items.value.items_json
                                      properties_json = items.value.properties_json
                                    }
                                  }

                                  dynamic "property" {
                                    for_each = items.value.property != null ? items.value.property : []
                                    content {
                                      name            = property.value.name
                                      type            = property.value.type
                                      description     = property.value.description
                                      items_json      = property.value.items_json
                                      properties_json = property.value.properties_json
                                      required        = property.value.required
                                    }
                                  }
                                }
                              }

                              dynamic "property" {
                                for_each = property.value.property != null ? property.value.property : []
                                content {
                                  name            = property.value.name
                                  type            = property.value.type
                                  description     = property.value.description
                                  items_json      = property.value.items_json
                                  properties_json = property.value.properties_json
                                  required        = property.value.required
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "s3" {
                    for_each = tool_schema.value.s3 != null ? tool_schema.value.s3 : []
                    content {
                      bucket_owner_account_id = s3.value.bucket_owner_account_id
                      uri                     = s3.value.uri
                    }
                  }
                }
              }
            }
          }

          dynamic "mcp_server" {
            for_each = mcp.value.mcp_server != null ? mcp.value.mcp_server : []
            content {
              endpoint          = mcp_server.value.endpoint
              listing_mode      = mcp_server.value.listing_mode
              resource_priority = mcp_server.value.resource_priority

              dynamic "mcp_tool_schema" {
                for_each = mcp_server.value.mcp_tool_schema != null ? mcp_server.value.mcp_tool_schema : []
                content {

                  dynamic "inline_payload" {
                    for_each = mcp_tool_schema.value.inline_payload != null ? mcp_tool_schema.value.inline_payload : []
                    content {
                      payload = inline_payload.value.payload
                    }
                  }

                  dynamic "s3" {
                    for_each = mcp_tool_schema.value.s3 != null ? mcp_tool_schema.value.s3 : []
                    content {
                      uri                     = s3.value.uri
                      bucket_owner_account_id = s3.value.bucket_owner_account_id
                    }
                  }
                }
              }
            }
          }

          dynamic "open_api_schema" {
            for_each = mcp.value.open_api_schema != null ? mcp.value.open_api_schema : []
            content {

              dynamic "inline_payload" {
                for_each = open_api_schema.value.inline_payload != null ? open_api_schema.value.inline_payload : []
                content {
                  payload = inline_payload.value.payload
                }
              }

              dynamic "s3" {
                for_each = open_api_schema.value.s3 != null ? open_api_schema.value.s3 : []
                content {
                  bucket_owner_account_id = s3.value.bucket_owner_account_id
                  uri                     = s3.value.uri
                }
              }
            }
          }

          dynamic "smithy_model" {
            for_each = mcp.value.smithy_model != null ? mcp.value.smithy_model : []
            content {

              dynamic "inline_payload" {
                for_each = smithy_model.value.inline_payload != null ? smithy_model.value.inline_payload : []
                content {
                  payload = inline_payload.value.payload
                }
              }

              dynamic "s3" {
                for_each = smithy_model.value.s3 != null ? smithy_model.value.s3 : []
                content {
                  bucket_owner_account_id = s3.value.bucket_owner_account_id
                  uri                     = s3.value.uri
                }
              }
            }
          }
        }
      }
    }
  }
}
