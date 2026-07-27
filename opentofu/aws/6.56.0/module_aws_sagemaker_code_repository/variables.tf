variable "sagemaker_code_repositories" {
  description = <<EOT
Map of sagemaker_code_repositories, attributes below
Required:
    - code_repository_name
    - git_config
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    code_repository_name = string
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    git_config           = list(object({
            repository_url = string
            branch         = optional(string)
            secret_arn     = optional(string)
        }))
  }))
}
