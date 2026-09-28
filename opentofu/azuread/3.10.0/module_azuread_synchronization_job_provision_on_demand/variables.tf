variable "synchronization_job_provision_on_demands" {
  description = <<EOT
Map of synchronization_job_provision_on_demands, attributes below
Required:
    - service_principal_id
    - synchronization_job_id
    - parameter
Optional:
    - triggers
EOT

  type = map(object({
    service_principal_id   = string
    synchronization_job_id = string
    triggers               = optional(map(string))
    parameter              = list(object({
            rule_id = string
            subject = list(object({
                object_id        = string
                object_type_name = string
            }))
        }))
  }))
}
