variable "connect_users" {
  description = <<EOT
Map of connect_users, attributes below
Required:
    - instance_id
    - name
    - routing_profile_id
    - security_profile_ids
    - phone_config
Optional:
    - directory_user_id
    - hierarchy_group_id
    - password
    - region
    - tags
    - tags_all
    - identity_info
EOT

  type = map(object({
    instance_id          = string
    name                 = string
    routing_profile_id   = string
    security_profile_ids = set(string)
    directory_user_id    = optional(string)
    hierarchy_group_id   = optional(string)
    password             = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    identity_info        = optional(list(object({
            email           = optional(string)
            first_name      = optional(string)
            last_name       = optional(string)
            secondary_email = optional(string)
        })))
    phone_config         = list(object({
            phone_type                    = string
            after_contact_work_time_limit = optional(number)
            auto_accept                   = optional(bool)
            desk_phone_number             = optional(string)
        }))
  }))
}
