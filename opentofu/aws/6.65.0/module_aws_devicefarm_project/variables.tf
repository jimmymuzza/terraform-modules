variable "devicefarm_projects" {
  description = <<EOT
Map of devicefarm_projects, attributes below
Required:
    - name
Optional:
    - default_job_timeout_minutes
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                        = string
    default_job_timeout_minutes = optional(number)
    region                      = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
  }))
}
