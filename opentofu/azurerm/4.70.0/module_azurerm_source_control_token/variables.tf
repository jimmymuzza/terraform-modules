variable "source_control_tokens" {
  description = <<EOT
Map of source_control_tokens, attributes below
Required:
    - token
    - type
Optional:
    - token_secret
EOT

  type = map(object({
    token        = string
    type         = string
    token_secret = optional(string)
  }))
}
