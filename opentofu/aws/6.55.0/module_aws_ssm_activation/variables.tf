variable "ssm_activations" {
  description = <<EOT
Map of ssm_activations, attributes below
Required:
    - iam_role
Optional:
    - description
    - expiration_date
    - name
    - region
    - registration_limit
    - tags
    - tags_all
EOT

  type = map(object({
    iam_role           = string
    description        = optional(string)
    expiration_date    = optional(string)
    name               = optional(string)
    region             = optional(string)
    registration_limit = optional(number)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
  }))
}
