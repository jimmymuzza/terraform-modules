variable "lexv2models_intents" {
  description = <<EOT
Map of lexv2models_intents, attributes below
Required:
    - bot_id
    - bot_version
    - locale_id
    - name
Optional:
    - description
    - parent_intent_signature
    - region
    - closing_setting
    - confirmation_setting
    - dialog_code_hook
    - fulfillment_code_hook
    - initial_response_setting
    - input_context
    - kendra_configuration
    - output_context
    - qna_intent_configuration
    - sample_utterance
    - slot_priority
EOT

  type = map(object({
    bot_id                   = string
    bot_version              = string
    locale_id                = string
    name                     = string
    description              = optional(string)
    parent_intent_signature  = optional(string)
    region                   = optional(string)
    closing_setting          = optional(list(object({
            active           = optional(bool)
            closing_response = optional(list(object({
                allow_interrupt = optional(bool)
                message_group   = optional(list(object({
                    message   = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                    variation = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                })))
            })))
            conditional      = optional(list(object({
                active             = bool
                conditional_branch = optional(list(object({
                    name      = string
                    condition = optional(list(object({
                        expression_string = string
                    })))
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
                default_branch     = optional(list(object({
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
            })))
            next_step        = optional(list(object({
                session_attributes = optional(map(string))
                dialog_action      = optional(list(object({
                    type                  = string
                    slot_to_elicit        = optional(string)
                    suppress_next_message = optional(bool)
                })))
                intent             = optional(list(object({
                    name = optional(string)
                    slot = optional(set(object({
                        map_block_key = string
                        shape         = optional(string)
                        value         = optional(list(object({
                            interpreted_value = optional(string)
                        })))
                    })))
                })))
            })))
        })))
    confirmation_setting     = optional(list(object({
            active                   = optional(bool)
            code_hook                = optional(list(object({
                active                       = bool
                enable_code_hook_invocation  = bool
                invocation_label             = optional(string)
                post_code_hook_specification = optional(list(object({
                    failure_conditional = optional(list(object({
                        active             = bool
                        conditional_branch = optional(list(object({
                            name      = string
                            condition = optional(list(object({
                                expression_string = string
                            })))
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                        default_branch     = optional(list(object({
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                    })))
                    failure_next_step   = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    failure_response    = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                    success_conditional = optional(list(object({
                        active             = bool
                        conditional_branch = optional(list(object({
                            name      = string
                            condition = optional(list(object({
                                expression_string = string
                            })))
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                        default_branch     = optional(list(object({
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                    })))
                    success_next_step   = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    success_response    = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                    timeout_conditional = optional(list(object({
                        active             = bool
                        conditional_branch = optional(list(object({
                            name      = string
                            condition = optional(list(object({
                                expression_string = string
                            })))
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                        default_branch     = optional(list(object({
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                    })))
                    timeout_next_step   = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    timeout_response    = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
            })))
            confirmation_conditional = optional(list(object({
                active             = bool
                conditional_branch = optional(list(object({
                    name      = string
                    condition = optional(list(object({
                        expression_string = string
                    })))
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
                default_branch     = optional(list(object({
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
            })))
            confirmation_next_step   = optional(list(object({
                session_attributes = optional(map(string))
                dialog_action      = optional(list(object({
                    type                  = string
                    slot_to_elicit        = optional(string)
                    suppress_next_message = optional(bool)
                })))
                intent             = optional(list(object({
                    name = optional(string)
                    slot = optional(set(object({
                        map_block_key = string
                        shape         = optional(string)
                        value         = optional(list(object({
                            interpreted_value = optional(string)
                        })))
                    })))
                })))
            })))
            confirmation_response    = optional(list(object({
                allow_interrupt = optional(bool)
                message_group   = optional(list(object({
                    message   = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                    variation = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                })))
            })))
            declination_conditional  = optional(list(object({
                active             = bool
                conditional_branch = optional(list(object({
                    name      = string
                    condition = optional(list(object({
                        expression_string = string
                    })))
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
                default_branch     = optional(list(object({
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
            })))
            declination_next_step    = optional(list(object({
                session_attributes = optional(map(string))
                dialog_action      = optional(list(object({
                    type                  = string
                    slot_to_elicit        = optional(string)
                    suppress_next_message = optional(bool)
                })))
                intent             = optional(list(object({
                    name = optional(string)
                    slot = optional(set(object({
                        map_block_key = string
                        shape         = optional(string)
                        value         = optional(list(object({
                            interpreted_value = optional(string)
                        })))
                    })))
                })))
            })))
            declination_response     = optional(list(object({
                allow_interrupt = optional(bool)
                message_group   = optional(list(object({
                    message   = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                    variation = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                })))
            })))
            elicitation_code_hook    = optional(list(object({
                enable_code_hook_invocation = optional(bool)
                invocation_label            = optional(string)
            })))
            failure_conditional      = optional(list(object({
                active             = bool
                conditional_branch = optional(list(object({
                    name      = string
                    condition = optional(list(object({
                        expression_string = string
                    })))
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
                default_branch     = optional(list(object({
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
            })))
            failure_next_step        = optional(list(object({
                session_attributes = optional(map(string))
                dialog_action      = optional(list(object({
                    type                  = string
                    slot_to_elicit        = optional(string)
                    suppress_next_message = optional(bool)
                })))
                intent             = optional(list(object({
                    name = optional(string)
                    slot = optional(set(object({
                        map_block_key = string
                        shape         = optional(string)
                        value         = optional(list(object({
                            interpreted_value = optional(string)
                        })))
                    })))
                })))
            })))
            failure_response         = optional(list(object({
                allow_interrupt = optional(bool)
                message_group   = optional(list(object({
                    message   = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                    variation = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                })))
            })))
            prompt_specification     = optional(list(object({
                max_retries                   = number
                allow_interrupt               = optional(bool)
                message_selection_strategy    = optional(string)
                message_group                 = optional(list(object({
                    message   = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                    variation = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                })))
                prompt_attempts_specification = optional(set(object({
                    map_block_key                      = string
                    allow_interrupt                    = optional(bool)
                    allowed_input_types                = optional(list(object({
                        allow_audio_input = bool
                        allow_dtmf_input  = bool
                    })))
                    audio_and_dtmf_input_specification = optional(list(object({
                        start_timeout_ms    = number
                        audio_specification = optional(list(object({
                            end_timeout_ms = number
                            max_length_ms  = number
                        })))
                        dtmf_specification  = optional(list(object({
                            deletion_character = string
                            end_character      = string
                            end_timeout_ms     = number
                            max_length         = number
                        })))
                    })))
                    text_input_specification           = optional(list(object({
                        start_timeout_ms = number
                    })))
                })))
            })))
        })))
    dialog_code_hook         = optional(list(object({
            enabled = bool
        })))
    fulfillment_code_hook    = optional(list(object({
            enabled                               = bool
            active                                = optional(bool)
            fulfillment_updates_specification     = optional(list(object({
                active             = bool
                timeout_in_seconds = optional(number)
                start_response     = optional(list(object({
                    allow_interrupt  = optional(bool)
                    delay_in_seconds = optional(number)
                    message_group    = optional(list(object({
                        message   = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                        variation = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                    })))
                })))
                update_response    = optional(list(object({
                    frequency_in_seconds = number
                    allow_interrupt      = optional(bool)
                    message_group        = optional(list(object({
                        message   = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                        variation = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                    })))
                })))
            })))
            post_fulfillment_status_specification = optional(list(object({
                failure_conditional = optional(list(object({
                    active             = bool
                    conditional_branch = optional(list(object({
                        name      = string
                        condition = optional(list(object({
                            expression_string = string
                        })))
                        next_step = optional(list(object({
                            session_attributes = optional(map(string))
                            dialog_action      = optional(list(object({
                                type                  = string
                                slot_to_elicit        = optional(string)
                                suppress_next_message = optional(bool)
                            })))
                            intent             = optional(list(object({
                                name = optional(string)
                                slot = optional(set(object({
                                    map_block_key = string
                                    shape         = optional(string)
                                    value         = optional(list(object({
                                        interpreted_value = optional(string)
                                    })))
                                })))
                            })))
                        })))
                        response  = optional(list(object({
                            allow_interrupt = optional(bool)
                            message_group   = optional(list(object({
                                message   = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                                variation = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                            })))
                        })))
                    })))
                    default_branch     = optional(list(object({
                        next_step = optional(list(object({
                            session_attributes = optional(map(string))
                            dialog_action      = optional(list(object({
                                type                  = string
                                slot_to_elicit        = optional(string)
                                suppress_next_message = optional(bool)
                            })))
                            intent             = optional(list(object({
                                name = optional(string)
                                slot = optional(set(object({
                                    map_block_key = string
                                    shape         = optional(string)
                                    value         = optional(list(object({
                                        interpreted_value = optional(string)
                                    })))
                                })))
                            })))
                        })))
                        response  = optional(list(object({
                            allow_interrupt = optional(bool)
                            message_group   = optional(list(object({
                                message   = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                                variation = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                            })))
                        })))
                    })))
                })))
                failure_next_step   = optional(list(object({
                    session_attributes = optional(map(string))
                    dialog_action      = optional(list(object({
                        type                  = string
                        slot_to_elicit        = optional(string)
                        suppress_next_message = optional(bool)
                    })))
                    intent             = optional(list(object({
                        name = optional(string)
                        slot = optional(set(object({
                            map_block_key = string
                            shape         = optional(string)
                            value         = optional(list(object({
                                interpreted_value = optional(string)
                            })))
                        })))
                    })))
                })))
                failure_response    = optional(list(object({
                    allow_interrupt = optional(bool)
                    message_group   = optional(list(object({
                        message   = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                        variation = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                    })))
                })))
                success_conditional = optional(list(object({
                    active             = bool
                    conditional_branch = optional(list(object({
                        name      = string
                        condition = optional(list(object({
                            expression_string = string
                        })))
                        next_step = optional(list(object({
                            session_attributes = optional(map(string))
                            dialog_action      = optional(list(object({
                                type                  = string
                                slot_to_elicit        = optional(string)
                                suppress_next_message = optional(bool)
                            })))
                            intent             = optional(list(object({
                                name = optional(string)
                                slot = optional(set(object({
                                    map_block_key = string
                                    shape         = optional(string)
                                    value         = optional(list(object({
                                        interpreted_value = optional(string)
                                    })))
                                })))
                            })))
                        })))
                        response  = optional(list(object({
                            allow_interrupt = optional(bool)
                            message_group   = optional(list(object({
                                message   = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                                variation = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                            })))
                        })))
                    })))
                    default_branch     = optional(list(object({
                        next_step = optional(list(object({
                            session_attributes = optional(map(string))
                            dialog_action      = optional(list(object({
                                type                  = string
                                slot_to_elicit        = optional(string)
                                suppress_next_message = optional(bool)
                            })))
                            intent             = optional(list(object({
                                name = optional(string)
                                slot = optional(set(object({
                                    map_block_key = string
                                    shape         = optional(string)
                                    value         = optional(list(object({
                                        interpreted_value = optional(string)
                                    })))
                                })))
                            })))
                        })))
                        response  = optional(list(object({
                            allow_interrupt = optional(bool)
                            message_group   = optional(list(object({
                                message   = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                                variation = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                            })))
                        })))
                    })))
                })))
                success_next_step   = optional(list(object({
                    session_attributes = optional(map(string))
                    dialog_action      = optional(list(object({
                        type                  = string
                        slot_to_elicit        = optional(string)
                        suppress_next_message = optional(bool)
                    })))
                    intent             = optional(list(object({
                        name = optional(string)
                        slot = optional(set(object({
                            map_block_key = string
                            shape         = optional(string)
                            value         = optional(list(object({
                                interpreted_value = optional(string)
                            })))
                        })))
                    })))
                })))
                success_response    = optional(list(object({
                    allow_interrupt = optional(bool)
                    message_group   = optional(list(object({
                        message   = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                        variation = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                    })))
                })))
                timeout_conditional = optional(list(object({
                    active             = bool
                    conditional_branch = optional(list(object({
                        name      = string
                        condition = optional(list(object({
                            expression_string = string
                        })))
                        next_step = optional(list(object({
                            session_attributes = optional(map(string))
                            dialog_action      = optional(list(object({
                                type                  = string
                                slot_to_elicit        = optional(string)
                                suppress_next_message = optional(bool)
                            })))
                            intent             = optional(list(object({
                                name = optional(string)
                                slot = optional(set(object({
                                    map_block_key = string
                                    shape         = optional(string)
                                    value         = optional(list(object({
                                        interpreted_value = optional(string)
                                    })))
                                })))
                            })))
                        })))
                        response  = optional(list(object({
                            allow_interrupt = optional(bool)
                            message_group   = optional(list(object({
                                message   = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                                variation = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                            })))
                        })))
                    })))
                    default_branch     = optional(list(object({
                        next_step = optional(list(object({
                            session_attributes = optional(map(string))
                            dialog_action      = optional(list(object({
                                type                  = string
                                slot_to_elicit        = optional(string)
                                suppress_next_message = optional(bool)
                            })))
                            intent             = optional(list(object({
                                name = optional(string)
                                slot = optional(set(object({
                                    map_block_key = string
                                    shape         = optional(string)
                                    value         = optional(list(object({
                                        interpreted_value = optional(string)
                                    })))
                                })))
                            })))
                        })))
                        response  = optional(list(object({
                            allow_interrupt = optional(bool)
                            message_group   = optional(list(object({
                                message   = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                                variation = optional(list(object({
                                    custom_payload      = optional(list(object({
                                        value = string
                                    })))
                                    image_response_card = optional(list(object({
                                        title     = string
                                        image_url = optional(string)
                                        subtitle  = optional(string)
                                        button    = optional(list(object({
                                            text  = string
                                            value = string
                                        })))
                                    })))
                                    plain_text_message  = optional(list(object({
                                        value = string
                                    })))
                                    ssml_message        = optional(list(object({
                                        value = string
                                    })))
                                })))
                            })))
                        })))
                    })))
                })))
                timeout_next_step   = optional(list(object({
                    session_attributes = optional(map(string))
                    dialog_action      = optional(list(object({
                        type                  = string
                        slot_to_elicit        = optional(string)
                        suppress_next_message = optional(bool)
                    })))
                    intent             = optional(list(object({
                        name = optional(string)
                        slot = optional(set(object({
                            map_block_key = string
                            shape         = optional(string)
                            value         = optional(list(object({
                                interpreted_value = optional(string)
                            })))
                        })))
                    })))
                })))
                timeout_response    = optional(list(object({
                    allow_interrupt = optional(bool)
                    message_group   = optional(list(object({
                        message   = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                        variation = optional(list(object({
                            custom_payload      = optional(list(object({
                                value = string
                            })))
                            image_response_card = optional(list(object({
                                title     = string
                                image_url = optional(string)
                                subtitle  = optional(string)
                                button    = optional(list(object({
                                    text  = string
                                    value = string
                                })))
                            })))
                            plain_text_message  = optional(list(object({
                                value = string
                            })))
                            ssml_message        = optional(list(object({
                                value = string
                            })))
                        })))
                    })))
                })))
            })))
        })))
    initial_response_setting = optional(list(object({
            code_hook        = optional(list(object({
                active                       = bool
                enable_code_hook_invocation  = bool
                invocation_label             = optional(string)
                post_code_hook_specification = optional(list(object({
                    failure_conditional = optional(list(object({
                        active             = bool
                        conditional_branch = optional(list(object({
                            name      = string
                            condition = optional(list(object({
                                expression_string = string
                            })))
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                        default_branch     = optional(list(object({
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                    })))
                    failure_next_step   = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    failure_response    = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                    success_conditional = optional(list(object({
                        active             = bool
                        conditional_branch = optional(list(object({
                            name      = string
                            condition = optional(list(object({
                                expression_string = string
                            })))
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                        default_branch     = optional(list(object({
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                    })))
                    success_next_step   = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    success_response    = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                    timeout_conditional = optional(list(object({
                        active             = bool
                        conditional_branch = optional(list(object({
                            name      = string
                            condition = optional(list(object({
                                expression_string = string
                            })))
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                        default_branch     = optional(list(object({
                            next_step = optional(list(object({
                                session_attributes = optional(map(string))
                                dialog_action      = optional(list(object({
                                    type                  = string
                                    slot_to_elicit        = optional(string)
                                    suppress_next_message = optional(bool)
                                })))
                                intent             = optional(list(object({
                                    name = optional(string)
                                    slot = optional(set(object({
                                        map_block_key = string
                                        shape         = optional(string)
                                        value         = optional(list(object({
                                            interpreted_value = optional(string)
                                        })))
                                    })))
                                })))
                            })))
                            response  = optional(list(object({
                                allow_interrupt = optional(bool)
                                message_group   = optional(list(object({
                                    message   = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                    variation = optional(list(object({
                                        custom_payload      = optional(list(object({
                                            value = string
                                        })))
                                        image_response_card = optional(list(object({
                                            title     = string
                                            image_url = optional(string)
                                            subtitle  = optional(string)
                                            button    = optional(list(object({
                                                text  = string
                                                value = string
                                            })))
                                        })))
                                        plain_text_message  = optional(list(object({
                                            value = string
                                        })))
                                        ssml_message        = optional(list(object({
                                            value = string
                                        })))
                                    })))
                                })))
                            })))
                        })))
                    })))
                    timeout_next_step   = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    timeout_response    = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
            })))
            conditional      = optional(list(object({
                active             = bool
                conditional_branch = optional(list(object({
                    name      = string
                    condition = optional(list(object({
                        expression_string = string
                    })))
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
                default_branch     = optional(list(object({
                    next_step = optional(list(object({
                        session_attributes = optional(map(string))
                        dialog_action      = optional(list(object({
                            type                  = string
                            slot_to_elicit        = optional(string)
                            suppress_next_message = optional(bool)
                        })))
                        intent             = optional(list(object({
                            name = optional(string)
                            slot = optional(set(object({
                                map_block_key = string
                                shape         = optional(string)
                                value         = optional(list(object({
                                    interpreted_value = optional(string)
                                })))
                            })))
                        })))
                    })))
                    response  = optional(list(object({
                        allow_interrupt = optional(bool)
                        message_group   = optional(list(object({
                            message   = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                            variation = optional(list(object({
                                custom_payload      = optional(list(object({
                                    value = string
                                })))
                                image_response_card = optional(list(object({
                                    title     = string
                                    image_url = optional(string)
                                    subtitle  = optional(string)
                                    button    = optional(list(object({
                                        text  = string
                                        value = string
                                    })))
                                })))
                                plain_text_message  = optional(list(object({
                                    value = string
                                })))
                                ssml_message        = optional(list(object({
                                    value = string
                                })))
                            })))
                        })))
                    })))
                })))
            })))
            initial_response = optional(list(object({
                allow_interrupt = optional(bool)
                message_group   = optional(list(object({
                    message   = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                    variation = optional(list(object({
                        custom_payload      = optional(list(object({
                            value = string
                        })))
                        image_response_card = optional(list(object({
                            title     = string
                            image_url = optional(string)
                            subtitle  = optional(string)
                            button    = optional(list(object({
                                text  = string
                                value = string
                            })))
                        })))
                        plain_text_message  = optional(list(object({
                            value = string
                        })))
                        ssml_message        = optional(list(object({
                            value = string
                        })))
                    })))
                })))
            })))
            next_step        = optional(list(object({
                session_attributes = optional(map(string))
                dialog_action      = optional(list(object({
                    type                  = string
                    slot_to_elicit        = optional(string)
                    suppress_next_message = optional(bool)
                })))
                intent             = optional(list(object({
                    name = optional(string)
                    slot = optional(set(object({
                        map_block_key = string
                        shape         = optional(string)
                        value         = optional(list(object({
                            interpreted_value = optional(string)
                        })))
                    })))
                })))
            })))
        })))
    input_context            = optional(list(object({
            name = string
        })))
    kendra_configuration     = optional(list(object({
            kendra_index                = string
            query_filter_string         = optional(string)
            query_filter_string_enabled = optional(bool)
        })))
    output_context           = optional(list(object({
            name                    = string
            time_to_live_in_seconds = number
            turns_to_live           = number
        })))
    qna_intent_configuration = optional(list(object({
            bedrock_model_configuration = optional(list(object({
                model_arn     = string
                custom_prompt = optional(string)
                trace_status  = optional(string)
                guardrail     = optional(list(object({
                    identifier = string
                    version    = string
                })))
            })))
            data_source_configuration   = optional(list(object({
                bedrock_knowledge_store_configuration = optional(list(object({
                    bedrock_knowledge_base_arn = string
                    exact_response             = optional(bool)
                    exact_response_fields      = optional(list(object({
                        answer_field = optional(string)
                    })))
                })))
                kendra_configuration                  = optional(list(object({
                    kendra_index                = string
                    exact_response              = optional(bool)
                    query_filter_string         = optional(string)
                    query_filter_string_enabled = optional(bool)
                })))
                opensearch_configuration              = optional(list(object({
                    domain_endpoint       = string
                    index_name            = string
                    exact_response        = optional(bool)
                    include_fields        = optional(list(string))
                    exact_response_fields = optional(list(object({
                        answer_field   = string
                        question_field = string
                    })))
                })))
            })))
        })))
    sample_utterance         = optional(list(object({
            utterance = string
        })))
    slot_priority            = optional(list(object({
            priority = number
            slot_id  = string
        })))
  }))
}
