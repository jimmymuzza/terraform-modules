resource "aws_mailmanager_rule_set" "mailmanager_rule_sets" {
  for_each = var.mailmanager_rule_sets

  name   = each.value.name
  region = each.value.region
  tags   = each.value.tags

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      name = rule.value.name

      dynamic "action" {
        for_each = rule.value.action != null ? rule.value.action : []
        content {

          dynamic "add_header" {
            for_each = action.value.add_header != null ? action.value.add_header : []
            content {
              header_name  = add_header.value.header_name
              header_value = add_header.value.header_value
            }
          }

          dynamic "archive" {
            for_each = action.value.archive != null ? action.value.archive : []
            content {
              target_archive        = archive.value.target_archive
              action_failure_policy = archive.value.action_failure_policy
            }
          }

          dynamic "bounce" {
            for_each = action.value.bounce != null ? action.value.bounce : []
            content {
              diagnostic_message    = bounce.value.diagnostic_message
              role_arn              = bounce.value.role_arn
              sender                = bounce.value.sender
              smtp_reply_code       = bounce.value.smtp_reply_code
              status_code           = bounce.value.status_code
              action_failure_policy = bounce.value.action_failure_policy
              message               = bounce.value.message
            }
          }

          dynamic "deliver_to_mailbox" {
            for_each = action.value.deliver_to_mailbox != null ? action.value.deliver_to_mailbox : []
            content {
              mailbox_arn           = deliver_to_mailbox.value.mailbox_arn
              role_arn              = deliver_to_mailbox.value.role_arn
              action_failure_policy = deliver_to_mailbox.value.action_failure_policy
            }
          }

          dynamic "deliver_to_q_business" {
            for_each = action.value.deliver_to_q_business != null ? action.value.deliver_to_q_business : []
            content {
              application_id        = deliver_to_q_business.value.application_id
              index_id              = deliver_to_q_business.value.index_id
              role_arn              = deliver_to_q_business.value.role_arn
              action_failure_policy = deliver_to_q_business.value.action_failure_policy
            }
          }

          dynamic "drop" {
            for_each = action.value.drop != null ? action.value.drop : []
            content {
            }
          }

          dynamic "invoke_lambda" {
            for_each = action.value.invoke_lambda != null ? action.value.invoke_lambda : []
            content {
              function_arn          = invoke_lambda.value.function_arn
              invocation_type       = invoke_lambda.value.invocation_type
              role_arn              = invoke_lambda.value.role_arn
              action_failure_policy = invoke_lambda.value.action_failure_policy
              retry_time_minutes    = invoke_lambda.value.retry_time_minutes
            }
          }

          dynamic "publish_to_sns" {
            for_each = action.value.publish_to_sns != null ? action.value.publish_to_sns : []
            content {
              role_arn              = publish_to_sns.value.role_arn
              topic_arn             = publish_to_sns.value.topic_arn
              action_failure_policy = publish_to_sns.value.action_failure_policy
              encoding              = publish_to_sns.value.encoding
              payload_type          = publish_to_sns.value.payload_type
            }
          }

          dynamic "relay" {
            for_each = action.value.relay != null ? action.value.relay : []
            content {
              relay                 = relay.value.relay
              action_failure_policy = relay.value.action_failure_policy
              mail_from             = relay.value.mail_from
            }
          }

          dynamic "replace_recipient" {
            for_each = action.value.replace_recipient != null ? action.value.replace_recipient : []
            content {
              replace_with = replace_recipient.value.replace_with
            }
          }

          dynamic "send" {
            for_each = action.value.send != null ? action.value.send : []
            content {
              role_arn              = send.value.role_arn
              action_failure_policy = send.value.action_failure_policy
            }
          }

          dynamic "write_to_s3" {
            for_each = action.value.write_to_s3 != null ? action.value.write_to_s3 : []
            content {
              role_arn              = write_to_s3.value.role_arn
              s3_bucket             = write_to_s3.value.s3_bucket
              action_failure_policy = write_to_s3.value.action_failure_policy
              s3_prefix             = write_to_s3.value.s3_prefix
              s3_sse_kms_key_id     = write_to_s3.value.s3_sse_kms_key_id
            }
          }
        }
      }

      dynamic "condition" {
        for_each = rule.value.condition != null ? rule.value.condition : []
        content {

          dynamic "boolean_expression" {
            for_each = condition.value.boolean_expression != null ? condition.value.boolean_expression : []
            content {
              operator = boolean_expression.value.operator

              dynamic "evaluate" {
                for_each = boolean_expression.value.evaluate != null ? boolean_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute

                  dynamic "analysis" {
                    for_each = evaluate.value.analysis != null ? evaluate.value.analysis : []
                    content {
                      analyzer     = analysis.value.analyzer
                      result_field = analysis.value.result_field
                    }
                  }

                  dynamic "is_in_address_list" {
                    for_each = evaluate.value.is_in_address_list != null ? evaluate.value.is_in_address_list : []
                    content {
                      address_lists = is_in_address_list.value.address_lists
                      attribute     = is_in_address_list.value.attribute
                    }
                  }
                }
              }
            }
          }

          dynamic "dmarc_expression" {
            for_each = condition.value.dmarc_expression != null ? condition.value.dmarc_expression : []
            content {
              operator = dmarc_expression.value.operator
              values   = dmarc_expression.value.values
            }
          }

          dynamic "ip_expression" {
            for_each = condition.value.ip_expression != null ? condition.value.ip_expression : []
            content {
              operator = ip_expression.value.operator
              values   = ip_expression.value.values

              dynamic "evaluate" {
                for_each = ip_expression.value.evaluate != null ? ip_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute
                }
              }
            }
          }

          dynamic "number_expression" {
            for_each = condition.value.number_expression != null ? condition.value.number_expression : []
            content {
              operator = number_expression.value.operator
              value    = number_expression.value.value

              dynamic "evaluate" {
                for_each = number_expression.value.evaluate != null ? number_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute
                }
              }
            }
          }

          dynamic "string_expression" {
            for_each = condition.value.string_expression != null ? condition.value.string_expression : []
            content {
              operator = string_expression.value.operator
              values   = string_expression.value.values

              dynamic "evaluate" {
                for_each = string_expression.value.evaluate != null ? string_expression.value.evaluate : []
                content {
                  attribute                    = evaluate.value.attribute
                  client_certificate_attribute = evaluate.value.client_certificate_attribute
                  mime_header_attribute        = evaluate.value.mime_header_attribute

                  dynamic "analysis" {
                    for_each = evaluate.value.analysis != null ? evaluate.value.analysis : []
                    content {
                      analyzer     = analysis.value.analyzer
                      result_field = analysis.value.result_field
                    }
                  }
                }
              }
            }
          }

          dynamic "verdict_expression" {
            for_each = condition.value.verdict_expression != null ? condition.value.verdict_expression : []
            content {
              operator = verdict_expression.value.operator
              values   = verdict_expression.value.values

              dynamic "evaluate" {
                for_each = verdict_expression.value.evaluate != null ? verdict_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute

                  dynamic "analysis" {
                    for_each = evaluate.value.analysis != null ? evaluate.value.analysis : []
                    content {
                      analyzer     = analysis.value.analyzer
                      result_field = analysis.value.result_field
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "unless" {
        for_each = rule.value.unless != null ? rule.value.unless : []
        content {

          dynamic "boolean_expression" {
            for_each = unless.value.boolean_expression != null ? unless.value.boolean_expression : []
            content {
              operator = boolean_expression.value.operator

              dynamic "evaluate" {
                for_each = boolean_expression.value.evaluate != null ? boolean_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute

                  dynamic "analysis" {
                    for_each = evaluate.value.analysis != null ? evaluate.value.analysis : []
                    content {
                      analyzer     = analysis.value.analyzer
                      result_field = analysis.value.result_field
                    }
                  }

                  dynamic "is_in_address_list" {
                    for_each = evaluate.value.is_in_address_list != null ? evaluate.value.is_in_address_list : []
                    content {
                      address_lists = is_in_address_list.value.address_lists
                      attribute     = is_in_address_list.value.attribute
                    }
                  }
                }
              }
            }
          }

          dynamic "dmarc_expression" {
            for_each = unless.value.dmarc_expression != null ? unless.value.dmarc_expression : []
            content {
              operator = dmarc_expression.value.operator
              values   = dmarc_expression.value.values
            }
          }

          dynamic "ip_expression" {
            for_each = unless.value.ip_expression != null ? unless.value.ip_expression : []
            content {
              operator = ip_expression.value.operator
              values   = ip_expression.value.values

              dynamic "evaluate" {
                for_each = ip_expression.value.evaluate != null ? ip_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute
                }
              }
            }
          }

          dynamic "number_expression" {
            for_each = unless.value.number_expression != null ? unless.value.number_expression : []
            content {
              operator = number_expression.value.operator
              value    = number_expression.value.value

              dynamic "evaluate" {
                for_each = number_expression.value.evaluate != null ? number_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute
                }
              }
            }
          }

          dynamic "string_expression" {
            for_each = unless.value.string_expression != null ? unless.value.string_expression : []
            content {
              operator = string_expression.value.operator
              values   = string_expression.value.values

              dynamic "evaluate" {
                for_each = string_expression.value.evaluate != null ? string_expression.value.evaluate : []
                content {
                  attribute                    = evaluate.value.attribute
                  client_certificate_attribute = evaluate.value.client_certificate_attribute
                  mime_header_attribute        = evaluate.value.mime_header_attribute

                  dynamic "analysis" {
                    for_each = evaluate.value.analysis != null ? evaluate.value.analysis : []
                    content {
                      analyzer     = analysis.value.analyzer
                      result_field = analysis.value.result_field
                    }
                  }
                }
              }
            }
          }

          dynamic "verdict_expression" {
            for_each = unless.value.verdict_expression != null ? unless.value.verdict_expression : []
            content {
              operator = verdict_expression.value.operator
              values   = verdict_expression.value.values

              dynamic "evaluate" {
                for_each = verdict_expression.value.evaluate != null ? verdict_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute

                  dynamic "analysis" {
                    for_each = evaluate.value.analysis != null ? evaluate.value.analysis : []
                    content {
                      analyzer     = analysis.value.analyzer
                      result_field = analysis.value.result_field
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
