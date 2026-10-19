variable "alb_target_group_attachments" {
  description = <<EOT
Map of alb_target_group_attachments, attributes below
Required:
    - target_group_arn
    - target_id
Optional:
    - availability_zone
    - port
    - quic_server_id
    - region
EOT

  type = map(object({
    target_group_arn  = string
    target_id         = string
    availability_zone = optional(string)
    port              = optional(number)
    quic_server_id    = optional(string)
    region            = optional(string)
  }))
}
