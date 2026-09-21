variable "connect_quick_connects" {
  description = <<EOT
Map of connect_quick_connects, attributes below
Required:
    - instance_id
    - name
    - quick_connect_config
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    instance_id          = string
    name                 = string
    description          = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    quick_connect_config = list(object({
            quick_connect_type = string
            phone_config       = optional(list(object({
                phone_number = string
            })))
            queue_config       = optional(list(object({
                contact_flow_id = string
                queue_id        = string
            })))
            user_config        = optional(list(object({
                contact_flow_id = string
                user_id         = string
            })))
        }))
  }))
}
