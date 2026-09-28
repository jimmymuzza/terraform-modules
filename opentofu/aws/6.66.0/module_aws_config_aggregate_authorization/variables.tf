variable "config_aggregate_authorizations" {
  description = <<EOT
Map of config_aggregate_authorizations, attributes below
Required:
    - account_id
Optional:
    - authorized_aws_region
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    account_id            = string
    authorized_aws_region = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
  }))
}
