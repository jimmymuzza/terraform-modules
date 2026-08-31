variable "s3_directory_buckets" {
  description = <<EOT
Map of s3_directory_buckets, attributes below
Required:
    - bucket
Optional:
    - data_redundancy
    - force_destroy
    - region
    - tags
    - type
    - location
EOT

  type = map(object({
    bucket          = string
    data_redundancy = optional(string)
    force_destroy   = optional(bool)
    region          = optional(string)
    tags            = optional(map(string))
    type            = optional(string)
    location        = optional(list(object({
            name = string
            type = optional(string)
        })))
  }))
}
