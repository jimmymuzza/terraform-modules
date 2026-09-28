variable "codegurureviewer_repository_associations" {
  description = <<EOT
Map of codegurureviewer_repository_associations, attributes below
Required:
    - repository
Optional:
    - region
    - tags
    - tags_all
    - kms_key_details
EOT

  type = map(object({
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    kms_key_details = optional(list(object({
            encryption_option = optional(string)
            kms_key_id        = optional(string)
        })))
    repository      = list(object({
            bitbucket                = optional(list(object({
                connection_arn = string
                name           = string
                owner          = string
            })))
            codecommit               = optional(list(object({
                name = string
            })))
            github_enterprise_server = optional(list(object({
                connection_arn = string
                name           = string
                owner          = string
            })))
            s3_bucket                = optional(list(object({
                bucket_name = string
                name        = string
            })))
        }))
  }))
}
