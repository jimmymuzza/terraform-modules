variable "lambda_code_signing_configs" {
  description = <<EOT
Map of lambda_code_signing_configs, attributes below
Required:
    - allowed_publishers
Optional:
    - description
    - region
    - tags
    - tags_all
    - policies
EOT

  type = map(object({
    description        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    allowed_publishers = list(object({
            signing_profile_version_arns = set(string)
        }))
    policies           = optional(list(object({
            untrusted_artifact_on_deployment = string
        })))
  }))
}
