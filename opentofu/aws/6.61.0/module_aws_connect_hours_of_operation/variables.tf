variable "connect_hours_of_operations" {
  description = <<EOT
Map of connect_hours_of_operations, attributes below
Required:
    - instance_id
    - name
    - time_zone
    - config
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    instance_id = string
    name        = string
    time_zone   = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    config      = set(object({
            day        = string
            end_time   = list(object({
                hours   = number
                minutes = number
            }))
            start_time = list(object({
                hours   = number
                minutes = number
            }))
        }))
  }))
}
