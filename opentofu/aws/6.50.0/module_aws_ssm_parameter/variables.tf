variable "ssm_parameters" {
  description = <<EOT
Map of ssm_parameters, attributes below
Required:
    - name
    - type
Optional:
    - allowed_pattern
    - arn
    - data_type
    - description
    - insecure_value
    - key_id
    - overwrite
    - region
    - tags
    - tags_all
    - tier
    - value
    - value_wo
    - value_wo_version
EOT

  type = map(object({
    name             = string
    type             = string
    allowed_pattern  = optional(string)
    arn              = optional(string)
    data_type        = optional(string)
    description      = optional(string)
    insecure_value   = optional(string)
    key_id           = optional(string)
    overwrite        = optional(bool)
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    tier             = optional(string)
    value            = optional(string)
    value_wo         = optional(string)
    value_wo_version = optional(number)
  }))
}
