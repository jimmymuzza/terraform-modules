variable "ecr_repository_policies" {
  description = <<EOT
Map of ecr_repository_policies, attributes below
Required:
    - policy
    - repository
Optional:
    - region
EOT

  type = map(object({
    policy     = string
    repository = string
    region     = optional(string)
  }))
}
