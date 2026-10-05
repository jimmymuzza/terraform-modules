variable "directory_service_directories" {
  description = <<EOT
Map of directory_service_directories, attributes below
Required:
    - name
    - password
Optional:
    - alias
    - description
    - desired_number_of_domain_controllers
    - edition
    - enable_directory_data_access
    - enable_sso
    - region
    - short_name
    - size
    - tags
    - tags_all
    - type
    - connect_settings
    - vpc_settings
EOT

  type = map(object({
    name                                 = string
    password                             = string
    alias                                = optional(string)
    description                          = optional(string)
    desired_number_of_domain_controllers = optional(number)
    edition                              = optional(string)
    enable_directory_data_access         = optional(bool)
    enable_sso                           = optional(bool)
    region                               = optional(string)
    short_name                           = optional(string)
    size                                 = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    type                                 = optional(string)
    connect_settings                     = optional(list(object({
            customer_dns_ips  = set(string)
            customer_username = string
            subnet_ids        = set(string)
            vpc_id            = string
        })))
    vpc_settings                         = optional(list(object({
            subnet_ids = set(string)
            vpc_id     = string
        })))
  }))
}
