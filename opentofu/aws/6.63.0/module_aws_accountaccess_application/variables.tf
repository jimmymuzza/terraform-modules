variable "accountaccess_applications" {
  description = <<EOT
Map of accountaccess_applications, attributes below
Optional:
    - region
    - tags
    - identity_source
EOT

  type = map(object({
    region          = optional(string)
    tags            = optional(map(string))
    identity_source = optional(list(object({
            identity_center = optional(list(object({
                instance_arn = string
            })))
        })))
  }))
}
