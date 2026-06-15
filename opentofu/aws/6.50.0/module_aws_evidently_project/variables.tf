variable "evidently_projects" {
  description = <<EOT
Map of evidently_projects, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - data_delivery
EOT

  type = map(object({
    name          = string
    description   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    data_delivery = optional(list(object({
            cloudwatch_logs = optional(list(object({
                log_group = optional(string)
            })))
            s3_destination  = optional(list(object({
                bucket = optional(string)
                prefix = optional(string)
            })))
        })))
  }))
}
