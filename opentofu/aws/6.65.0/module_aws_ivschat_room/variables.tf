variable "ivschat_rooms" {
  description = <<EOT
Map of ivschat_rooms, attributes below
Optional:
    - logging_configuration_identifiers
    - maximum_message_length
    - maximum_message_rate_per_second
    - name
    - region
    - tags
    - tags_all
    - message_review_handler
EOT

  type = map(object({
    logging_configuration_identifiers = optional(list(string))
    maximum_message_length            = optional(number)
    maximum_message_rate_per_second   = optional(number)
    name                              = optional(string)
    region                            = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    message_review_handler            = optional(list(object({
            fallback_result = optional(string)
            uri             = optional(string)
        })))
  }))
}
