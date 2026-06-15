variable "stream_analytics_job_schedules" {
  description = <<EOT
Map of stream_analytics_job_schedules, attributes below
Required:
    - start_mode
    - stream_analytics_job_id
Optional:
    - start_time
EOT

  type = map(object({
    start_mode              = string
    stream_analytics_job_id = string
    start_time              = optional(string)
  }))
}
