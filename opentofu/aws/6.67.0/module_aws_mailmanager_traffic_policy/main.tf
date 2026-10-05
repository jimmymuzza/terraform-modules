resource "aws_mailmanager_traffic_policy" "mailmanager_traffic_policies" {
  for_each = var.mailmanager_traffic_policies

  default_action         = each.value.default_action
  name                   = each.value.name
  max_message_size_bytes = each.value.max_message_size_bytes
  region                 = each.value.region
  tags                   = each.value.tags

  dynamic "policy_statement" {
    for_each = each.value.policy_statement != null ? each.value.policy_statement : []
    content {
      action = policy_statement.value.action

      dynamic "condition" {
        for_each = policy_statement.value.condition != null ? policy_statement.value.condition : []
        content {

          dynamic "boolean_expression" {
            for_each = condition.value.boolean_expression != null ? condition.value.boolean_expression : []
            content {
              operator = boolean_expression.value.operator

              dynamic "evaluate" {
                for_each = boolean_expression.value.evaluate != null ? boolean_expression.value.evaluate : []
                content {

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

          dynamic "ipv6_expression" {
            for_each = condition.value.ipv6_expression != null ? condition.value.ipv6_expression : []
            content {
              operator = ipv6_expression.value.operator
              values   = ipv6_expression.value.values

              dynamic "evaluate" {
                for_each = ipv6_expression.value.evaluate != null ? ipv6_expression.value.evaluate : []
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

          dynamic "tls_expression" {
            for_each = condition.value.tls_expression != null ? condition.value.tls_expression : []
            content {
              operator = tls_expression.value.operator
              value    = tls_expression.value.value

              dynamic "evaluate" {
                for_each = tls_expression.value.evaluate != null ? tls_expression.value.evaluate : []
                content {
                  attribute = evaluate.value.attribute
                }
              }
            }
          }
        }
      }
    }
  }
}
