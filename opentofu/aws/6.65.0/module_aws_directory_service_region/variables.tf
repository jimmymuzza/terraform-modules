variable "directory_service_regions" {
  description = <<EOT
Map of directory_service_regions, attributes below
Required:
    - directory_id
    - region_name
    - vpc_settings
Optional:
    - desired_number_of_domain_controllers
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    directory_id                         = string
    region_name                          = string
    desired_number_of_domain_controllers = optional(number)
    region                               = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    vpc_settings                         = list(object({
            subnet_ids = set(string)
            vpc_id     = string
        }))
  }))
}
