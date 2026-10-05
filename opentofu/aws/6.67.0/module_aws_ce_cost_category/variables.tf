variable "ce_cost_categories" {
  description = <<EOT
Map of ce_cost_categories, attributes below
Required:
    - name
    - rule_version
    - rule
Optional:
    - default_value
    - effective_start
    - tags
    - tags_all
    - split_charge_rule
EOT

  type = map(object({
    name              = string
    rule_version      = string
    default_value     = optional(string)
    effective_start   = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    rule              = list(object({
            type            = optional(string)
            value           = optional(string)
            inherited_value = optional(list(object({
                dimension_key  = optional(string)
                dimension_name = optional(string)
            })))
            rule            = optional(list(object({
                and           = optional(set(object({
                    and           = optional(set(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    cost_category = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                    dimension     = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                    not           = optional(list(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    or            = optional(set(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    tags          = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                })))
                cost_category = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                dimension     = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
                not           = optional(list(object({
                    and           = optional(set(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    cost_category = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                    dimension     = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                    not           = optional(list(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    or            = optional(set(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    tags          = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                })))
                or            = optional(set(object({
                    and           = optional(set(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    cost_category = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                    dimension     = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                    not           = optional(list(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    or            = optional(set(object({
                        cost_category = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        dimension     = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                        tags          = optional(list(object({
                            key           = optional(string)
                            match_options = optional(set(string))
                            values        = optional(set(string))
                        })))
                    })))
                    tags          = optional(list(object({
                        key           = optional(string)
                        match_options = optional(set(string))
                        values        = optional(set(string))
                    })))
                })))
                tags          = optional(list(object({
                    key           = optional(string)
                    match_options = optional(set(string))
                    values        = optional(set(string))
                })))
            })))
        }))
    split_charge_rule = optional(set(object({
            method    = string
            source    = string
            targets   = list(string)
            parameter = optional(set(object({
                type   = optional(string)
                values = optional(list(string))
            })))
        })))
  }))
}
