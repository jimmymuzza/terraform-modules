resource "aws_ce_cost_category" "ce_cost_categories" {
  for_each = var.ce_cost_categories

  name            = each.value.name
  rule_version    = each.value.rule_version
  default_value   = each.value.default_value
  effective_start = each.value.effective_start
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      type  = rule.value.type
      value = rule.value.value

      dynamic "inherited_value" {
        for_each = rule.value.inherited_value != null ? rule.value.inherited_value : []
        content {
          dimension_key  = inherited_value.value.dimension_key
          dimension_name = inherited_value.value.dimension_name
        }
      }

      dynamic "rule" {
        for_each = rule.value.rule != null ? rule.value.rule : []
        content {

          dynamic "and" {
            for_each = rule.value.and != null ? rule.value.and : []
            content {

              dynamic "and" {
                for_each = and.value.and != null ? and.value.and : []
                content {

                  dynamic "cost_category" {
                    for_each = and.value.cost_category != null ? and.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = and.value.dimension != null ? and.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = and.value.tags != null ? and.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "cost_category" {
                for_each = and.value.cost_category != null ? and.value.cost_category : []
                content {
                  key           = cost_category.value.key
                  match_options = cost_category.value.match_options
                  values        = cost_category.value.values
                }
              }

              dynamic "dimension" {
                for_each = and.value.dimension != null ? and.value.dimension : []
                content {
                  key           = dimension.value.key
                  match_options = dimension.value.match_options
                  values        = dimension.value.values
                }
              }

              dynamic "not" {
                for_each = and.value.not != null ? and.value.not : []
                content {

                  dynamic "cost_category" {
                    for_each = not.value.cost_category != null ? not.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = not.value.dimension != null ? not.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = not.value.tags != null ? not.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "or" {
                for_each = and.value.or != null ? and.value.or : []
                content {

                  dynamic "cost_category" {
                    for_each = or.value.cost_category != null ? or.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = or.value.dimension != null ? or.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = or.value.tags != null ? or.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "tags" {
                for_each = and.value.tags != null ? and.value.tags : []
                content {
                  key           = tags.value.key
                  match_options = tags.value.match_options
                  values        = tags.value.values
                }
              }
            }
          }

          dynamic "cost_category" {
            for_each = rule.value.cost_category != null ? rule.value.cost_category : []
            content {
              key           = cost_category.value.key
              match_options = cost_category.value.match_options
              values        = cost_category.value.values
            }
          }

          dynamic "dimension" {
            for_each = rule.value.dimension != null ? rule.value.dimension : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }

          dynamic "not" {
            for_each = rule.value.not != null ? rule.value.not : []
            content {

              dynamic "and" {
                for_each = not.value.and != null ? not.value.and : []
                content {

                  dynamic "cost_category" {
                    for_each = and.value.cost_category != null ? and.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = and.value.dimension != null ? and.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = and.value.tags != null ? and.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "cost_category" {
                for_each = not.value.cost_category != null ? not.value.cost_category : []
                content {
                  key           = cost_category.value.key
                  match_options = cost_category.value.match_options
                  values        = cost_category.value.values
                }
              }

              dynamic "dimension" {
                for_each = not.value.dimension != null ? not.value.dimension : []
                content {
                  key           = dimension.value.key
                  match_options = dimension.value.match_options
                  values        = dimension.value.values
                }
              }

              dynamic "not" {
                for_each = not.value.not != null ? not.value.not : []
                content {

                  dynamic "cost_category" {
                    for_each = not.value.cost_category != null ? not.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = not.value.dimension != null ? not.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = not.value.tags != null ? not.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "or" {
                for_each = not.value.or != null ? not.value.or : []
                content {

                  dynamic "cost_category" {
                    for_each = or.value.cost_category != null ? or.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = or.value.dimension != null ? or.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = or.value.tags != null ? or.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "tags" {
                for_each = not.value.tags != null ? not.value.tags : []
                content {
                  key           = tags.value.key
                  match_options = tags.value.match_options
                  values        = tags.value.values
                }
              }
            }
          }

          dynamic "or" {
            for_each = rule.value.or != null ? rule.value.or : []
            content {

              dynamic "and" {
                for_each = or.value.and != null ? or.value.and : []
                content {

                  dynamic "cost_category" {
                    for_each = and.value.cost_category != null ? and.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = and.value.dimension != null ? and.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = and.value.tags != null ? and.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "cost_category" {
                for_each = or.value.cost_category != null ? or.value.cost_category : []
                content {
                  key           = cost_category.value.key
                  match_options = cost_category.value.match_options
                  values        = cost_category.value.values
                }
              }

              dynamic "dimension" {
                for_each = or.value.dimension != null ? or.value.dimension : []
                content {
                  key           = dimension.value.key
                  match_options = dimension.value.match_options
                  values        = dimension.value.values
                }
              }

              dynamic "not" {
                for_each = or.value.not != null ? or.value.not : []
                content {

                  dynamic "cost_category" {
                    for_each = not.value.cost_category != null ? not.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = not.value.dimension != null ? not.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = not.value.tags != null ? not.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "or" {
                for_each = or.value.or != null ? or.value.or : []
                content {

                  dynamic "cost_category" {
                    for_each = or.value.cost_category != null ? or.value.cost_category : []
                    content {
                      key           = cost_category.value.key
                      match_options = cost_category.value.match_options
                      values        = cost_category.value.values
                    }
                  }

                  dynamic "dimension" {
                    for_each = or.value.dimension != null ? or.value.dimension : []
                    content {
                      key           = dimension.value.key
                      match_options = dimension.value.match_options
                      values        = dimension.value.values
                    }
                  }

                  dynamic "tags" {
                    for_each = or.value.tags != null ? or.value.tags : []
                    content {
                      key           = tags.value.key
                      match_options = tags.value.match_options
                      values        = tags.value.values
                    }
                  }
                }
              }

              dynamic "tags" {
                for_each = or.value.tags != null ? or.value.tags : []
                content {
                  key           = tags.value.key
                  match_options = tags.value.match_options
                  values        = tags.value.values
                }
              }
            }
          }

          dynamic "tags" {
            for_each = rule.value.tags != null ? rule.value.tags : []
            content {
              key           = tags.value.key
              match_options = tags.value.match_options
              values        = tags.value.values
            }
          }
        }
      }
    }
  }

  dynamic "split_charge_rule" {
    for_each = each.value.split_charge_rule != null ? each.value.split_charge_rule : []
    content {
      method  = split_charge_rule.value.method
      source  = split_charge_rule.value.source
      targets = split_charge_rule.value.targets

      dynamic "parameter" {
        for_each = split_charge_rule.value.parameter != null ? split_charge_rule.value.parameter : []
        content {
          type   = parameter.value.type
          values = parameter.value.values
        }
      }
    }
  }
}
