variable "observabilityadmin_telemetry_rule_for_organizations" {
  description = <<EOT
Map of observabilityadmin_telemetry_rule_for_organizations, attributes below
Required:
    - rule_name
Optional:
    - region
    - tags
    - rule
EOT

  type = map(object({
    rule_name = string
    region    = optional(string)
    tags      = optional(map(string))
    rule      = optional(list(object({
            telemetry_type            = string
            all_regions               = optional(bool)
            allow_field_updates       = optional(bool)
            regions                   = optional(set(string))
            resource_type             = optional(string)
            scope                     = optional(string)
            selection_criteria        = optional(string)
            telemetry_source_types    = optional(list(string))
            destination_configuration = optional(list(object({
                destination_pattern                  = optional(string)
                destination_type                     = optional(string)
                retention_in_days                    = optional(number)
                cloudtrail_parameters                = optional(list(object({
                    advanced_event_selectors = optional(list(object({
                        name            = optional(string)
                        field_selectors = optional(list(object({
                            field           = string
                            ends_with       = optional(list(string))
                            equals          = optional(list(string))
                            not_ends_with   = optional(list(string))
                            not_equals      = optional(list(string))
                            not_starts_with = optional(list(string))
                            starts_with     = optional(list(string))
                        })))
                    })))
                })))
                elb_load_balancer_logging_parameters = optional(list(object({
                    field_delimiter = optional(string)
                    output_format   = optional(string)
                })))
                log_delivery_parameters              = optional(list(object({
                    log_types = optional(list(string))
                })))
                msk_monitoring_parameters            = optional(list(object({
                    enhanced_monitoring = optional(string)
                })))
                vpc_flow_log_parameters              = optional(list(object({
                    log_format               = optional(string)
                    max_aggregation_interval = optional(number)
                    traffic_type             = optional(string)
                })))
                waf_logging_parameters               = optional(list(object({
                    log_type        = optional(string)
                    logging_filter  = optional(list(object({
                        default_behavior = optional(string)
                        filters          = optional(list(object({
                            behavior    = optional(string)
                            requirement = optional(string)
                            conditions  = optional(list(object({
                                action_condition     = optional(list(object({
                                    action = string
                                })))
                                label_name_condition = optional(list(object({
                                    label_name = optional(string)
                                })))
                            })))
                        })))
                    })))
                    redacted_fields = optional(list(object({
                        method        = optional(string)
                        query_string  = optional(string)
                        uri_path      = optional(string)
                        single_header = optional(list(object({
                            name = string
                        })))
                    })))
                })))
            })))
        })))
  }))
}
