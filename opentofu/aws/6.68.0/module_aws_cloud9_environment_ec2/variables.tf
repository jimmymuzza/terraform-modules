variable "cloud9_environment_ec2s" {
  description = <<EOT
Map of cloud9_environment_ec2s, attributes below
Required:
    - image_id
    - instance_type
    - name
Optional:
    - automatic_stop_time_minutes
    - connection_type
    - description
    - owner_arn
    - region
    - subnet_id
    - tags
    - tags_all
EOT

  type = map(object({
    image_id                    = string
    instance_type               = string
    name                        = string
    automatic_stop_time_minutes = optional(number)
    connection_type             = optional(string)
    description                 = optional(string)
    owner_arn                   = optional(string)
    region                      = optional(string)
    subnet_id                   = optional(string)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
  }))
}
