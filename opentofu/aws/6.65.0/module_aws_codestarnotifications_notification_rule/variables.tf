variable "codestarnotifications_notification_rules" {
  description = <<EOT
Map of codestarnotifications_notification_rules, attributes below
Required:
    - detail_type
    - event_type_ids
    - name
    - resource
Optional:
    - region
    - status
    - tags
    - tags_all
    - target
EOT

  type = map(object({
    detail_type    = string
    event_type_ids = set(string)
    name           = string
    resource       = string
    region         = optional(string)
    status         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    target         = optional(set(object({
            address = string
            type    = optional(string)
        })))
  }))
}
