variable "devopsguru_service_integrations" {
  description = <<EOT
Map of devopsguru_service_integrations, attributes below
Optional:
    - region
    - kms_server_side_encryption
    - logs_anomaly_detection
    - ops_center
EOT

  type = map(object({
    region                     = optional(string)
    kms_server_side_encryption = optional(list(object({
            kms_key_id    = optional(string)
            opt_in_status = optional(string)
            type          = optional(string)
        })))
    logs_anomaly_detection     = optional(list(object({
            opt_in_status = optional(string)
        })))
    ops_center                 = optional(list(object({
            opt_in_status = optional(string)
        })))
  }))
}
