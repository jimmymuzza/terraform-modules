resource "aws_wafv2_web_acl_rule_group_association" "wafv2_web_acl_rule_group_associations" {
  for_each = var.wafv2_web_acl_rule_group_associations

  priority        = each.value.priority
  rule_name       = each.value.rule_name
  web_acl_arn     = each.value.web_acl_arn
  override_action = each.value.override_action
  region          = each.value.region

  dynamic "managed_rule_group" {
    for_each = each.value.managed_rule_group != null ? each.value.managed_rule_group : []
    content {
      name        = managed_rule_group.value.name
      vendor_name = managed_rule_group.value.vendor_name
      version     = managed_rule_group.value.version

      dynamic "managed_rule_group_configs" {
        for_each = managed_rule_group.value.managed_rule_group_configs != null ? managed_rule_group.value.managed_rule_group_configs : []
        content {

          dynamic "aws_managed_rules_acfp_rule_set" {
            for_each = managed_rule_group_configs.value.aws_managed_rules_acfp_rule_set != null ? managed_rule_group_configs.value.aws_managed_rules_acfp_rule_set : []
            content {
              creation_path          = aws_managed_rules_acfp_rule_set.value.creation_path
              registration_page_path = aws_managed_rules_acfp_rule_set.value.registration_page_path
              enable_regex_in_path   = aws_managed_rules_acfp_rule_set.value.enable_regex_in_path

              dynamic "request_inspection" {
                for_each = aws_managed_rules_acfp_rule_set.value.request_inspection != null ? aws_managed_rules_acfp_rule_set.value.request_inspection : []
                content {
                  payload_type = request_inspection.value.payload_type

                  dynamic "address_fields" {
                    for_each = request_inspection.value.address_fields != null ? request_inspection.value.address_fields : []
                    content {
                      identifiers = address_fields.value.identifiers
                    }
                  }

                  dynamic "email_field" {
                    for_each = request_inspection.value.email_field != null ? request_inspection.value.email_field : []
                    content {
                      identifier = email_field.value.identifier
                    }
                  }

                  dynamic "password_field" {
                    for_each = request_inspection.value.password_field != null ? request_inspection.value.password_field : []
                    content {
                      identifier = password_field.value.identifier
                    }
                  }

                  dynamic "phone_number_fields" {
                    for_each = request_inspection.value.phone_number_fields != null ? request_inspection.value.phone_number_fields : []
                    content {
                      identifiers = phone_number_fields.value.identifiers
                    }
                  }

                  dynamic "username_field" {
                    for_each = request_inspection.value.username_field != null ? request_inspection.value.username_field : []
                    content {
                      identifier = username_field.value.identifier
                    }
                  }
                }
              }

              dynamic "response_inspection" {
                for_each = aws_managed_rules_acfp_rule_set.value.response_inspection != null ? aws_managed_rules_acfp_rule_set.value.response_inspection : []
                content {

                  dynamic "body_contains" {
                    for_each = response_inspection.value.body_contains != null ? response_inspection.value.body_contains : []
                    content {
                      failure_strings = body_contains.value.failure_strings
                      success_strings = body_contains.value.success_strings
                    }
                  }

                  dynamic "header" {
                    for_each = response_inspection.value.header != null ? response_inspection.value.header : []
                    content {
                      failure_values = header.value.failure_values
                      name           = header.value.name
                      success_values = header.value.success_values
                    }
                  }

                  dynamic "json" {
                    for_each = response_inspection.value.json != null ? response_inspection.value.json : []
                    content {
                      failure_values = json.value.failure_values
                      identifier     = json.value.identifier
                      success_values = json.value.success_values
                    }
                  }

                  dynamic "status_code" {
                    for_each = response_inspection.value.status_code != null ? response_inspection.value.status_code : []
                    content {
                      failure_codes = status_code.value.failure_codes
                      success_codes = status_code.value.success_codes
                    }
                  }
                }
              }
            }
          }

          dynamic "aws_managed_rules_anti_ddos_rule_set" {
            for_each = managed_rule_group_configs.value.aws_managed_rules_anti_ddos_rule_set != null ? managed_rule_group_configs.value.aws_managed_rules_anti_ddos_rule_set : []
            content {
              sensitivity_to_block = aws_managed_rules_anti_ddos_rule_set.value.sensitivity_to_block

              dynamic "client_side_action_config" {
                for_each = aws_managed_rules_anti_ddos_rule_set.value.client_side_action_config != null ? aws_managed_rules_anti_ddos_rule_set.value.client_side_action_config : []
                content {

                  dynamic "challenge" {
                    for_each = client_side_action_config.value.challenge != null ? client_side_action_config.value.challenge : []
                    content {
                      usage_of_action = challenge.value.usage_of_action
                      sensitivity     = challenge.value.sensitivity

                      dynamic "exempt_uri_regular_expression" {
                        for_each = challenge.value.exempt_uri_regular_expression != null ? challenge.value.exempt_uri_regular_expression : []
                        content {
                          regex_string = exempt_uri_regular_expression.value.regex_string
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "aws_managed_rules_atp_rule_set" {
            for_each = managed_rule_group_configs.value.aws_managed_rules_atp_rule_set != null ? managed_rule_group_configs.value.aws_managed_rules_atp_rule_set : []
            content {
              login_path           = aws_managed_rules_atp_rule_set.value.login_path
              enable_regex_in_path = aws_managed_rules_atp_rule_set.value.enable_regex_in_path

              dynamic "request_inspection" {
                for_each = aws_managed_rules_atp_rule_set.value.request_inspection != null ? aws_managed_rules_atp_rule_set.value.request_inspection : []
                content {
                  payload_type = request_inspection.value.payload_type

                  dynamic "password_field" {
                    for_each = request_inspection.value.password_field != null ? request_inspection.value.password_field : []
                    content {
                      identifier = password_field.value.identifier
                    }
                  }

                  dynamic "username_field" {
                    for_each = request_inspection.value.username_field != null ? request_inspection.value.username_field : []
                    content {
                      identifier = username_field.value.identifier
                    }
                  }
                }
              }

              dynamic "response_inspection" {
                for_each = aws_managed_rules_atp_rule_set.value.response_inspection != null ? aws_managed_rules_atp_rule_set.value.response_inspection : []
                content {

                  dynamic "body_contains" {
                    for_each = response_inspection.value.body_contains != null ? response_inspection.value.body_contains : []
                    content {
                      failure_strings = body_contains.value.failure_strings
                      success_strings = body_contains.value.success_strings
                    }
                  }

                  dynamic "header" {
                    for_each = response_inspection.value.header != null ? response_inspection.value.header : []
                    content {
                      failure_values = header.value.failure_values
                      name           = header.value.name
                      success_values = header.value.success_values
                    }
                  }

                  dynamic "json" {
                    for_each = response_inspection.value.json != null ? response_inspection.value.json : []
                    content {
                      failure_values = json.value.failure_values
                      identifier     = json.value.identifier
                      success_values = json.value.success_values
                    }
                  }

                  dynamic "status_code" {
                    for_each = response_inspection.value.status_code != null ? response_inspection.value.status_code : []
                    content {
                      failure_codes = status_code.value.failure_codes
                      success_codes = status_code.value.success_codes
                    }
                  }
                }
              }
            }
          }

          dynamic "aws_managed_rules_bot_control_rule_set" {
            for_each = managed_rule_group_configs.value.aws_managed_rules_bot_control_rule_set != null ? managed_rule_group_configs.value.aws_managed_rules_bot_control_rule_set : []
            content {
              inspection_level        = aws_managed_rules_bot_control_rule_set.value.inspection_level
              enable_machine_learning = aws_managed_rules_bot_control_rule_set.value.enable_machine_learning
            }
          }
        }
      }

      dynamic "rule_action_override" {
        for_each = managed_rule_group.value.rule_action_override != null ? managed_rule_group.value.rule_action_override : []
        content {
          name = rule_action_override.value.name

          dynamic "action_to_use" {
            for_each = rule_action_override.value.action_to_use != null ? rule_action_override.value.action_to_use : []
            content {

              dynamic "allow" {
                for_each = action_to_use.value.allow != null ? action_to_use.value.allow : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = allow.value.custom_request_handling != null ? allow.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "block" {
                for_each = action_to_use.value.block != null ? action_to_use.value.block : []
                content {

                  dynamic "custom_response" {
                    for_each = block.value.custom_response != null ? block.value.custom_response : []
                    content {
                      response_code            = custom_response.value.response_code
                      custom_response_body_key = custom_response.value.custom_response_body_key

                      dynamic "response_header" {
                        for_each = custom_response.value.response_header != null ? custom_response.value.response_header : []
                        content {
                          name  = response_header.value.name
                          value = response_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "captcha" {
                for_each = action_to_use.value.captcha != null ? action_to_use.value.captcha : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = captcha.value.custom_request_handling != null ? captcha.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "challenge" {
                for_each = action_to_use.value.challenge != null ? action_to_use.value.challenge : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = challenge.value.custom_request_handling != null ? challenge.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "count" {
                for_each = action_to_use.value.count != null ? action_to_use.value.count : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = count.value.custom_request_handling != null ? count.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
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
    }
  }

  dynamic "rule_group_reference" {
    for_each = each.value.rule_group_reference != null ? each.value.rule_group_reference : []
    content {
      arn = rule_group_reference.value.arn

      dynamic "rule_action_override" {
        for_each = rule_group_reference.value.rule_action_override != null ? rule_group_reference.value.rule_action_override : []
        content {
          name = rule_action_override.value.name

          dynamic "action_to_use" {
            for_each = rule_action_override.value.action_to_use != null ? rule_action_override.value.action_to_use : []
            content {

              dynamic "allow" {
                for_each = action_to_use.value.allow != null ? action_to_use.value.allow : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = allow.value.custom_request_handling != null ? allow.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "block" {
                for_each = action_to_use.value.block != null ? action_to_use.value.block : []
                content {

                  dynamic "custom_response" {
                    for_each = block.value.custom_response != null ? block.value.custom_response : []
                    content {
                      response_code            = custom_response.value.response_code
                      custom_response_body_key = custom_response.value.custom_response_body_key

                      dynamic "response_header" {
                        for_each = custom_response.value.response_header != null ? custom_response.value.response_header : []
                        content {
                          name  = response_header.value.name
                          value = response_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "captcha" {
                for_each = action_to_use.value.captcha != null ? action_to_use.value.captcha : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = captcha.value.custom_request_handling != null ? captcha.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "challenge" {
                for_each = action_to_use.value.challenge != null ? action_to_use.value.challenge : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = challenge.value.custom_request_handling != null ? challenge.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
                        }
                      }
                    }
                  }
                }
              }

              dynamic "count" {
                for_each = action_to_use.value.count != null ? action_to_use.value.count : []
                content {

                  dynamic "custom_request_handling" {
                    for_each = count.value.custom_request_handling != null ? count.value.custom_request_handling : []
                    content {

                      dynamic "insert_header" {
                        for_each = custom_request_handling.value.insert_header != null ? custom_request_handling.value.insert_header : []
                        content {
                          name  = insert_header.value.name
                          value = insert_header.value.value
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
    }
  }

  dynamic "visibility_config" {
    for_each = each.value.visibility_config != null ? each.value.visibility_config : []
    content {
      cloudwatch_metrics_enabled = visibility_config.value.cloudwatch_metrics_enabled
      metric_name                = visibility_config.value.metric_name
      sampled_requests_enabled   = visibility_config.value.sampled_requests_enabled
    }
  }
}
