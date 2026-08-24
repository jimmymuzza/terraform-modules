variable "iot_provisioning_templates" {
  description = <<EOT
Map of iot_provisioning_templates, attributes below
Required:
    - name
    - provisioning_role_arn
    - template_body
Optional:
    - description
    - enabled
    - region
    - tags
    - tags_all
    - type
    - pre_provisioning_hook
EOT

  type = map(object({
    name                  = string
    provisioning_role_arn = string
    template_body         = string
    description           = optional(string)
    enabled               = optional(bool)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    type                  = optional(string)
    pre_provisioning_hook = optional(list(object({
            target_arn      = string
            payload_version = optional(string)
        })))
  }))
}
