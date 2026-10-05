variable "pinpointsmsvoicev2_keywords" {
  description = <<EOT
Map of pinpointsmsvoicev2_keywords, attributes below
Required:
    - keyword
    - keyword_message
    - origination_identity_arn
Optional:
    - keyword_action
    - region
EOT

  type = map(object({
    keyword                  = string
    keyword_message          = string
    origination_identity_arn = string
    keyword_action           = optional(string)
    region                   = optional(string)
  }))
}
