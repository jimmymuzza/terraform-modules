variable "lexv2models_slot_types" {
  description = <<EOT
Map of lexv2models_slot_types, attributes below
Required:
    - bot_id
    - bot_version
    - locale_id
    - name
Optional:
    - description
    - parent_slot_type_signature
    - region
    - composite_slot_type_setting
    - external_source_setting
    - slot_type_values
    - value_selection_setting
EOT

  type = map(object({
    bot_id                      = string
    bot_version                 = string
    locale_id                   = string
    name                        = string
    description                 = optional(string)
    parent_slot_type_signature  = optional(string)
    region                      = optional(string)
    composite_slot_type_setting = optional(list(object({
            sub_slots = optional(list(object({
                name         = string
                slot_type_id = string
            })))
        })))
    external_source_setting     = optional(list(object({
            grammar_slot_type_setting = optional(list(object({
                source = optional(list(object({
                    kms_key_arn    = string
                    s3_bucket_name = string
                    s3_object_key  = string
                })))
            })))
        })))
    slot_type_values            = optional(list(object({
            sample_value = optional(list(object({
                value = string
            })))
            synonyms     = optional(list(object({
                value = string
            })))
        })))
    value_selection_setting     = optional(list(object({
            resolution_strategy          = string
            advanced_recognition_setting = optional(list(object({
                audio_recognition_strategy = optional(string)
            })))
            regex_filter                 = optional(list(object({
                pattern = string
            })))
        })))
  }))
}
