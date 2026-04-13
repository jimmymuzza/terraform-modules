variable "quicksight_data_sets" {
  description = <<EOT
Map of quicksight_data_sets, attributes below
Required:
    - data_set_id
    - import_mode
    - name
Optional:
    - aws_account_id
    - region
    - tags
    - tags_all
    - use_as
    - column_groups
    - column_level_permission_rules
    - data_set_usage_configuration
    - field_folders
    - logical_table_map
    - permissions
    - physical_table_map
    - refresh_properties
    - row_level_permission_data_set
    - row_level_permission_tag_configuration
EOT

  type = map(object({
    data_set_id                            = string
    import_mode                            = string
    name                                   = string
    aws_account_id                         = optional(string)
    region                                 = optional(string)
    tags                                   = optional(map(string))
    tags_all                               = optional(map(string))
    use_as                                 = optional(string)
    column_groups                          = optional(list(object({
            geo_spatial_column_group = optional(list(object({
                columns      = list(string)
                country_code = string
                name         = string
            })))
        })))
    column_level_permission_rules          = optional(list(object({
            column_names = optional(list(string))
            principals   = optional(list(string))
        })))
    data_set_usage_configuration           = optional(list(object({
            disable_use_as_direct_query_source = optional(bool)
            disable_use_as_imported_source     = optional(bool)
        })))
    field_folders                          = optional(set(object({
            field_folders_id = string
            columns          = optional(list(string))
            description      = optional(string)
        })))
    logical_table_map                      = optional(set(object({
            alias                = string
            logical_table_map_id = string
            data_transforms      = optional(list(object({
                cast_column_type_operation = optional(list(object({
                    column_name     = string
                    new_column_type = string
                    format          = optional(string)
                })))
                create_columns_operation   = optional(list(object({
                    columns = list(object({
                        column_id   = string
                        column_name = string
                        expression  = string
                    }))
                })))
                filter_operation           = optional(list(object({
                    condition_expression = string
                })))
                project_operation          = optional(list(object({
                    projected_columns = list(string)
                })))
                rename_column_operation    = optional(list(object({
                    column_name     = string
                    new_column_name = string
                })))
                tag_column_operation       = optional(list(object({
                    column_name = string
                    tags        = list(object({
                        column_geographic_role = optional(string)
                        column_description     = optional(list(object({
                            text = optional(string)
                        })))
                    }))
                })))
                untag_column_operation     = optional(list(object({
                    column_name = string
                    tag_names   = list(string)
                })))
            })))
            source               = list(object({
                data_set_arn      = optional(string)
                physical_table_id = optional(string)
                join_instruction  = optional(list(object({
                    left_operand              = string
                    on_clause                 = string
                    right_operand             = string
                    type                      = string
                    left_join_key_properties  = optional(list(object({
                        unique_key = optional(bool)
                    })))
                    right_join_key_properties = optional(list(object({
                        unique_key = optional(bool)
                    })))
                })))
            }))
        })))
    permissions                            = optional(set(object({
            actions   = set(string)
            principal = string
        })))
    physical_table_map                     = optional(set(object({
            physical_table_map_id = string
            custom_sql            = optional(list(object({
                data_source_arn = string
                name            = string
                sql_query       = string
                columns         = optional(list(object({
                    name = string
                    type = string
                })))
            })))
            relational_table      = optional(list(object({
                data_source_arn = string
                name            = string
                catalog         = optional(string)
                schema          = optional(string)
                input_columns   = list(object({
                    name = string
                    type = string
                }))
            })))
            s3_source             = optional(list(object({
                data_source_arn = string
                input_columns   = list(object({
                    name = string
                    type = string
                }))
                upload_settings = list(object({
                    contains_header = optional(bool)
                    delimiter       = optional(string)
                    format          = optional(string)
                    start_from_row  = optional(number)
                    text_qualifier  = optional(string)
                }))
            })))
        })))
    refresh_properties                     = optional(list(object({
            refresh_configuration = list(object({
                incremental_refresh = list(object({
                    lookback_window = list(object({
                        column_name = string
                        size        = number
                        size_unit   = string
                    }))
                }))
            }))
        })))
    row_level_permission_data_set          = optional(list(object({
            arn               = string
            permission_policy = string
            format_version    = optional(string)
            namespace         = optional(string)
            status            = optional(string)
        })))
    row_level_permission_tag_configuration = optional(list(object({
            status    = optional(string)
            tag_rules = list(object({
                column_name               = string
                tag_key                   = string
                match_all_value           = optional(string)
                tag_multi_value_delimiter = optional(string)
            }))
        })))
  }))
}
