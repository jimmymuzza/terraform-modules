variable "medialive_inputs" {
  description = <<EOT
Map of medialive_inputs, attributes below
Required:
    - name
    - type
Optional:
    - input_security_groups
    - region
    - role_arn
    - tags
    - tags_all
    - destinations
    - input_devices
    - media_connect_flows
    - sources
    - vpc
EOT

  type = map(object({
    name                  = string
    type                  = string
    input_security_groups = optional(list(string))
    region                = optional(string)
    role_arn              = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    destinations          = optional(set(object({
            stream_name = string
        })))
    input_devices         = optional(set(object({

        })))
    media_connect_flows   = optional(set(object({
            flow_arn = string
        })))
    sources               = optional(set(object({
            password_param = string
            url            = string
            username       = string
        })))
    vpc                   = optional(list(object({
            subnet_ids         = list(string)
            security_group_ids = optional(list(string))
        })))
  }))
}
