variable "mssql_job_schedules" {
  description = <<EOT
Map of mssql_job_schedules, attributes below
Required:
    - job_id
    - type
Optional:
    - enabled
    - end_time
    - interval
    - start_time
EOT

  type = map(object({
    job_id     = string
    type       = string
    enabled    = optional(bool)
    end_time   = optional(string)
    interval   = optional(string)
    start_time = optional(string)
  }))
}
