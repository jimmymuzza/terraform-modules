variable "bedrock_foundation_model_agreements" {
  description = <<EOT
Map of bedrock_foundation_model_agreements, attributes below
Required:
    - model_id
    - offer_token
Optional:
    - region
EOT

  type = map(object({
    model_id    = string
    offer_token = string
    region      = optional(string)
  }))
}
