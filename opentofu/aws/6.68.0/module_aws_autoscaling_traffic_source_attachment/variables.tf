variable "autoscaling_traffic_source_attachments" {
  description = <<EOT
Map of autoscaling_traffic_source_attachments, attributes below
Required:
    - autoscaling_group_name
Optional:
    - region
    - traffic_source
EOT

  type = map(object({
    autoscaling_group_name = string
    region                 = optional(string)
    traffic_source         = optional(list(object({
            identifier = string
            type       = string
        })))
  }))
}
