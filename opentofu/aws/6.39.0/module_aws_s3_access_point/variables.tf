variable "s3_access_points" {
  description = <<EOT
Map of s3_access_points, attributes below
Required:
    - bucket
    - name
Optional:
    - account_id
    - bucket_account_id
    - policy
    - region
    - tags
    - tags_all
    - public_access_block_configuration
    - vpc_configuration
EOT

  type = map(object({
    bucket                            = string
    name                              = string
    account_id                        = optional(string)
    bucket_account_id                 = optional(string)
    policy                            = optional(string)
    region                            = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
    public_access_block_configuration = optional(list(object({
            block_public_acls       = optional(bool)
            block_public_policy     = optional(bool)
            ignore_public_acls      = optional(bool)
            restrict_public_buckets = optional(bool)
        })))
    vpc_configuration                 = optional(list(object({
            vpc_id = string
        })))
  }))
}
