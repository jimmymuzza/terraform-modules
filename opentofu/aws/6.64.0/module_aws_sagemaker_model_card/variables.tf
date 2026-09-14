variable "sagemaker_model_cards" {
  description = <<EOT
Map of sagemaker_model_cards, attributes below
Required:
    - content
    - model_card_name
    - model_card_status
Optional:
    - region
    - tags
    - security_config
EOT

  type = map(object({
    content           = string
    model_card_name   = string
    model_card_status = string
    region            = optional(string)
    tags              = optional(map(string))
    security_config   = optional(list(object({
            kms_key_id = string
        })))
  }))
}
