variable "pinpointsmsvoicev2_configuration_sets" {
  description = <<EOT
Map of pinpointsmsvoicev2_configuration_sets, attributes below
Required:
    - name
Optional:
    - default_message_type
    - default_sender_id
    - region
    - tags
EOT

  type = map(object({
    name                 = string
    default_message_type = optional(string)
    default_sender_id    = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
  }))
}
