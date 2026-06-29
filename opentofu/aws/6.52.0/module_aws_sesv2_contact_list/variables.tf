variable "sesv2_contact_lists" {
  description = <<EOT
Map of sesv2_contact_lists, attributes below
Required:
    - contact_list_name
Optional:
    - description
    - region
    - tags
    - tags_all
    - topic
EOT

  type = map(object({
    contact_list_name = string
    description       = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    topic             = optional(set(object({
            default_subscription_status = string
            display_name                = string
            topic_name                  = string
            description                 = optional(string)
        })))
  }))
}
