variable "qbusiness_applications" {
  description = <<EOT
Map of qbusiness_applications, attributes below
Required:
    - display_name
    - iam_service_role_arn
    - identity_center_instance_arn
Optional:
    - description
    - region
    - tags
    - attachments_configuration
    - encryption_configuration
EOT

  type = map(object({
    display_name                 = string
    iam_service_role_arn         = string
    identity_center_instance_arn = string
    description                  = optional(string)
    region                       = optional(string)
    tags                         = optional(map(string))
    attachments_configuration    = optional(list(object({
            attachments_control_mode = string
        })))
    encryption_configuration     = optional(list(object({
            kms_key_id = string
        })))
  }))
}
