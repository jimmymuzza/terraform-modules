variable "pinpoint_event_streams" {
  description = <<EOT
Map of pinpoint_event_streams, attributes below
Required:
    - application_id
    - destination_stream_arn
    - role_arn
Optional:
    - region
EOT

  type = map(object({
    application_id         = string
    destination_stream_arn = string
    role_arn               = string
    region                 = optional(string)
  }))
}
