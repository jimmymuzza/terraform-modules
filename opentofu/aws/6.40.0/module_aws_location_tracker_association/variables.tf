variable "location_tracker_associations" {
  description = <<EOT
Map of location_tracker_associations, attributes below
Required:
    - consumer_arn
    - tracker_name
Optional:
    - region
EOT

  type = map(object({
    consumer_arn = string
    tracker_name = string
    region       = optional(string)
  }))
}
