variable "rds_reserved_instances" {
  description = <<EOT
Map of rds_reserved_instances, attributes below
Required:
    - offering_id
Optional:
    - instance_count
    - region
    - reservation_id
    - tags
    - tags_all
EOT

  type = map(object({
    offering_id    = string
    instance_count = optional(number)
    region         = optional(string)
    reservation_id = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
  }))
}
