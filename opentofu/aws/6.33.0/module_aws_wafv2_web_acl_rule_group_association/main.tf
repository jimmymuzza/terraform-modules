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
}
