variable "synchronization_jobs" {
  description = <<EOT
Map of synchronization_jobs, attributes below
Required:
    - service_principal_id
    - template_id
Optional:
    - enabled
EOT

  type = map(object({
    service_principal_id = string
    template_id          = string
    enabled              = optional(bool)
  }))
}
