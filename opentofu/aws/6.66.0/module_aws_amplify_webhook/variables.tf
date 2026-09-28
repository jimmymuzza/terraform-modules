variable "amplify_webhooks" {
  description = <<EOT
Map of amplify_webhooks, attributes below
Required:
    - app_id
    - branch_name
Optional:
    - description
    - region
EOT

  type = map(object({
    app_id      = string
    branch_name = string
    description = optional(string)
    region      = optional(string)
  }))
}
