resource "aws_cloudwatch_log_transformer" "cloudwatch_log_transformers" {
  for_each = var.cloudwatch_log_transformers

  log_group_arn = each.value.log_group_arn
  region        = each.value.region

  dynamic "transformer_config" {
    for_each = each.value.transformer_config != null ? each.value.transformer_config : []
    content {

      dynamic "add_keys" {
        for_each = transformer_config.value.add_keys != null ? transformer_config.value.add_keys : []
        content {

          dynamic "entry" {
            for_each = add_keys.value.entry != null ? add_keys.value.entry : []
            content {
              key                 = entry.value.key
              value               = entry.value.value
              overwrite_if_exists = entry.value.overwrite_if_exists
            }
          }
        }
      }

      dynamic "copy_value" {
        for_each = transformer_config.value.copy_value != null ? transformer_config.value.copy_value : []
        content {

          dynamic "entry" {
            for_each = copy_value.value.entry != null ? copy_value.value.entry : []
            content {
              source              = entry.value.source
              target              = entry.value.target
              overwrite_if_exists = entry.value.overwrite_if_exists
            }
          }
        }
      }

      dynamic "csv" {
        for_each = transformer_config.value.csv != null ? transformer_config.value.csv : []
        content {
          columns         = csv.value.columns
          delimiter       = csv.value.delimiter
          quote_character = csv.value.quote_character
          source          = csv.value.source
        }
      }

      dynamic "date_time_converter" {
        for_each = transformer_config.value.date_time_converter != null ? transformer_config.value.date_time_converter : []
        content {
          match_patterns  = date_time_converter.value.match_patterns
          source          = date_time_converter.value.source
          target          = date_time_converter.value.target
          locale          = date_time_converter.value.locale
          source_timezone = date_time_converter.value.source_timezone
          target_format   = date_time_converter.value.target_format
          target_timezone = date_time_converter.value.target_timezone
        }
      }

      dynamic "delete_keys" {
        for_each = transformer_config.value.delete_keys != null ? transformer_config.value.delete_keys : []
        content {
          with_keys = delete_keys.value.with_keys
        }
      }

      dynamic "grok" {
        for_each = transformer_config.value.grok != null ? transformer_config.value.grok : []
        content {
          match  = grok.value.match
          source = grok.value.source
        }
      }

      dynamic "list_to_map" {
        for_each = transformer_config.value.list_to_map != null ? transformer_config.value.list_to_map : []
        content {
          key               = list_to_map.value.key
          source            = list_to_map.value.source
          flatten           = list_to_map.value.flatten
          flattened_element = list_to_map.value.flattened_element
          target            = list_to_map.value.target
          value_key         = list_to_map.value.value_key
        }
      }

      dynamic "lower_case_string" {
        for_each = transformer_config.value.lower_case_string != null ? transformer_config.value.lower_case_string : []
        content {
          with_keys = lower_case_string.value.with_keys
        }
      }

      dynamic "move_keys" {
        for_each = transformer_config.value.move_keys != null ? transformer_config.value.move_keys : []
        content {

          dynamic "entry" {
            for_each = move_keys.value.entry != null ? move_keys.value.entry : []
            content {
              source              = entry.value.source
              target              = entry.value.target
              overwrite_if_exists = entry.value.overwrite_if_exists
            }
          }
        }
      }

      dynamic "parse_cloudfront" {
        for_each = transformer_config.value.parse_cloudfront != null ? transformer_config.value.parse_cloudfront : []
        content {
          source = parse_cloudfront.value.source
        }
      }

      dynamic "parse_json" {
        for_each = transformer_config.value.parse_json != null ? transformer_config.value.parse_json : []
        content {
          destination = parse_json.value.destination
          source      = parse_json.value.source
        }
      }

      dynamic "parse_key_value" {
        for_each = transformer_config.value.parse_key_value != null ? transformer_config.value.parse_key_value : []
        content {
          destination         = parse_key_value.value.destination
          field_delimiter     = parse_key_value.value.field_delimiter
          key_prefix          = parse_key_value.value.key_prefix
          key_value_delimiter = parse_key_value.value.key_value_delimiter
          non_match_value     = parse_key_value.value.non_match_value
          overwrite_if_exists = parse_key_value.value.overwrite_if_exists
          source              = parse_key_value.value.source
        }
      }

      dynamic "parse_postgres" {
        for_each = transformer_config.value.parse_postgres != null ? transformer_config.value.parse_postgres : []
        content {
          source = parse_postgres.value.source
        }
      }

      dynamic "parse_route53" {
        for_each = transformer_config.value.parse_route53 != null ? transformer_config.value.parse_route53 : []
        content {
          source = parse_route53.value.source
        }
      }

      dynamic "parse_to_ocsf" {
        for_each = transformer_config.value.parse_to_ocsf != null ? transformer_config.value.parse_to_ocsf : []
        content {
          event_source = parse_to_ocsf.value.event_source
          ocsf_version = parse_to_ocsf.value.ocsf_version
          source       = parse_to_ocsf.value.source
        }
      }

      dynamic "parse_vpc" {
        for_each = transformer_config.value.parse_vpc != null ? transformer_config.value.parse_vpc : []
        content {
          source = parse_vpc.value.source
        }
      }

      dynamic "parse_waf" {
        for_each = transformer_config.value.parse_waf != null ? transformer_config.value.parse_waf : []
        content {
          source = parse_waf.value.source
        }
      }

      dynamic "rename_keys" {
        for_each = transformer_config.value.rename_keys != null ? transformer_config.value.rename_keys : []
        content {

          dynamic "entry" {
            for_each = rename_keys.value.entry != null ? rename_keys.value.entry : []
            content {
              key                 = entry.value.key
              rename_to           = entry.value.rename_to
              overwrite_if_exists = entry.value.overwrite_if_exists
            }
          }
        }
      }

      dynamic "split_string" {
        for_each = transformer_config.value.split_string != null ? transformer_config.value.split_string : []
        content {

          dynamic "entry" {
            for_each = split_string.value.entry != null ? split_string.value.entry : []
            content {
              delimiter = entry.value.delimiter
              source    = entry.value.source
            }
          }
        }
      }

      dynamic "substitute_string" {
        for_each = transformer_config.value.substitute_string != null ? transformer_config.value.substitute_string : []
        content {

          dynamic "entry" {
            for_each = substitute_string.value.entry != null ? substitute_string.value.entry : []
            content {
              from   = entry.value.from
              source = entry.value.source
              to     = entry.value.to
            }
          }
        }
      }

      dynamic "trim_string" {
        for_each = transformer_config.value.trim_string != null ? transformer_config.value.trim_string : []
        content {
          with_keys = trim_string.value.with_keys
        }
      }

      dynamic "type_converter" {
        for_each = transformer_config.value.type_converter != null ? transformer_config.value.type_converter : []
        content {

          dynamic "entry" {
            for_each = type_converter.value.entry != null ? type_converter.value.entry : []
            content {
              key  = entry.value.key
              type = entry.value.type
            }
          }
        }
      }

      dynamic "upper_case_string" {
        for_each = transformer_config.value.upper_case_string != null ? transformer_config.value.upper_case_string : []
        content {
          with_keys = upper_case_string.value.with_keys
        }
      }
    }
  }
}
