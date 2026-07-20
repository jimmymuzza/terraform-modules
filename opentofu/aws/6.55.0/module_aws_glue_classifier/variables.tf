variable "glue_classifiers" {
  description = <<EOT
Map of glue_classifiers, attributes below
Required:
    - name
Optional:
    - region
    - csv_classifier
    - grok_classifier
    - json_classifier
    - xml_classifier
EOT

  type = map(object({
    name            = string
    region          = optional(string)
    csv_classifier  = optional(list(object({
            allow_single_column        = optional(bool)
            contains_header            = optional(string)
            custom_datatype_configured = optional(bool)
            custom_datatypes           = optional(list(string))
            delimiter                  = optional(string)
            disable_value_trimming     = optional(bool)
            header                     = optional(list(string))
            quote_symbol               = optional(string)
            serde                      = optional(string)
        })))
    grok_classifier = optional(list(object({
            classification  = string
            grok_pattern    = string
            custom_patterns = optional(string)
        })))
    json_classifier = optional(list(object({
            json_path = string
        })))
    xml_classifier  = optional(list(object({
            classification = string
            row_tag        = string
        })))
  }))
}
