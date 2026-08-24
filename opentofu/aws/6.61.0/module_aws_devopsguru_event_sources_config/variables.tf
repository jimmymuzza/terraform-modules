variable "devopsguru_event_sources_configs" {
  description = <<EOT
Map of devopsguru_event_sources_configs, attributes below
Optional:
    - region
    - event_sources
EOT

  type = map(object({
    region        = optional(string)
    event_sources = optional(list(object({
            amazon_code_guru_profiler = optional(list(object({
                status = string
            })))
        })))
  }))
}
