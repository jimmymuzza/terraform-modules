variable "m2_applications" {
  description = <<EOT
Map of m2_applications, attributes below
Required:
    - engine_type
    - name
Optional:
    - description
    - kms_key_id
    - region
    - role_arn
    - tags
    - definition
EOT

  type = map(object({
    engine_type = string
    name        = string
    description = optional(string)
    kms_key_id  = optional(string)
    region      = optional(string)
    role_arn    = optional(string)
    tags        = optional(map(string))
    definition  = optional(list(object({
            content     = optional(string)
            s3_location = optional(string)
        })))
  }))
}
