variable "glue_dev_endpoints" {
  description = <<EOT
Map of glue_dev_endpoints, attributes below
Required:
    - name
    - role_arn
Optional:
    - arguments
    - extra_jars_s3_path
    - extra_python_libs_s3_path
    - glue_version
    - number_of_nodes
    - number_of_workers
    - public_key
    - public_keys
    - region
    - security_configuration
    - security_group_ids
    - subnet_id
    - tags
    - tags_all
    - worker_type
EOT

  type = map(object({
    name                      = string
    role_arn                  = string
    arguments                 = optional(map(string))
    extra_jars_s3_path        = optional(string)
    extra_python_libs_s3_path = optional(string)
    glue_version              = optional(string)
    number_of_nodes           = optional(number)
    number_of_workers         = optional(number)
    public_key                = optional(string)
    public_keys               = optional(set(string))
    region                    = optional(string)
    security_configuration    = optional(string)
    security_group_ids        = optional(set(string))
    subnet_id                 = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    worker_type               = optional(string)
  }))
}
