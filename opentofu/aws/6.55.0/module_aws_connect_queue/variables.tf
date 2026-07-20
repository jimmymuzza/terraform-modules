variable "connect_queues" {
  description = <<EOT
Map of connect_queues, attributes below
Required:
    - hours_of_operation_id
    - instance_id
    - name
Optional:
    - description
    - max_contacts
    - quick_connect_ids
    - region
    - status
    - tags
    - tags_all
    - outbound_caller_config
EOT

  type = map(object({
    hours_of_operation_id  = string
    instance_id            = string
    name                   = string
    description            = optional(string)
    max_contacts           = optional(number)
    quick_connect_ids      = optional(set(string))
    region                 = optional(string)
    status                 = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    outbound_caller_config = optional(list(object({
            outbound_caller_id_name      = optional(string)
            outbound_caller_id_number_id = optional(string)
            outbound_flow_id             = optional(string)
        })))
  }))
}
