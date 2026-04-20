variable "container_app_environment_managed_certificates" {
  description = <<EOT
Map of container_app_environment_managed_certificates, attributes below
Required:
    - container_app_environment_id
    - name
    - subject_name
Optional:
    - domain_control_validation
    - tags
EOT

  type = map(object({
    container_app_environment_id = string
    name                         = string
    subject_name                 = string
    domain_control_validation    = optional(string)
    tags                         = optional(map(string))
  }))
}
