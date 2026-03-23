variable "spring_cloud_customized_accelerators" {
  description = <<EOT
Map of spring_cloud_customized_accelerators, attributes below
Required:
    - name
    - spring_cloud_accelerator_id
    - git_repository
Optional:
    - accelerator_tags
    - accelerator_type
    - description
    - display_name
    - icon_url
EOT

  type = map(object({
    name                        = string
    spring_cloud_accelerator_id = string
    accelerator_tags            = optional(list(string))
    accelerator_type            = optional(string)
    description                 = optional(string)
    display_name                = optional(string)
    icon_url                    = optional(string)
    git_repository              = list(object({
            url                 = string
            branch              = optional(string)
            ca_certificate_id   = optional(string)
            commit              = optional(string)
            git_tag             = optional(string)
            interval_in_seconds = optional(number)
            path                = optional(string)
            basic_auth          = optional(list(object({
                password = string
                username = string
            })))
            ssh_auth            = optional(list(object({
                private_key        = string
                host_key           = optional(string)
                host_key_algorithm = optional(string)
            })))
        }))
  }))
}
