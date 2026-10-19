variable "lexv2models_slots" {
  description = <<EOT
Map of lexv2models_slots, attributes below
Required:
    - bot_id
    - bot_version
    - intent_id
    - locale_id
    - name
Optional:
    - description
    - region
    - slot_type_id
    - multiple_values_setting
    - obfuscation_setting
    - sub_slot_setting
    - value_elicitation_setting
EOT

  type = map(object({
    bot_id                    = string
    bot_version               = string
    intent_id                 = string
    locale_id                 = string
    name                      = string
    description               = optional(string)
    region                    = optional(string)
    slot_type_id              = optional(string)
    multiple_values_setting   = optional(list(object({
            allow_multiple_values = optional(bool)
        })))
    obfuscation_setting       = optional(list(object({
            obfuscation_setting_type = string
        })))
    sub_slot_setting          = optional(list(object({
            expression         = optional(string)
            slot_specification = optional(set(object({
                map_block_key             = string
                slot_type_id              = string
                value_elicitation_setting = optional(list(object({
                    default_value_specification     = optional(list(object({
                        default_value_list = optional(list(object({
                            default_value = string
                        })))
                    })))
                    prompt_specification            = optional(list(object({
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
                    sample_utterance                = optional(list(object({
                        utterance = string
                    })))
                    wait_and_continue_specification = optional(list(object({
                        active                 = optional(bool)
                        continue_response      = optional(list(object({
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
                        still_waiting_response = optional(list(object({
                            frequency_in_seconds = number
                            timeout_in_seconds   = number
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
                        waiting_response       = optional(list(object({
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
            })))
        })))
    value_elicitation_setting = optional(list(object({
            slot_constraint                 = string
            default_value_specification     = optional(list(object({
                default_value_list = optional(list(object({
                    default_value = string
                })))
            })))
            prompt_specification            = optional(list(object({
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
            sample_utterance                = optional(list(object({
                utterance = string
            })))
            slot_resolution_setting         = optional(list(object({
                slot_resolution_strategy = string
            })))
            wait_and_continue_specification = optional(list(object({
                active                 = optional(bool)
                continue_response      = optional(list(object({
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
                still_waiting_response = optional(list(object({
                    frequency_in_seconds = number
                    timeout_in_seconds   = number
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
                waiting_response       = optional(list(object({
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
  }))
}
