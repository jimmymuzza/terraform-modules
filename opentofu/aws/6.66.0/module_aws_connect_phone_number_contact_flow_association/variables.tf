variable "connect_phone_number_contact_flow_associations" {
  description = <<EOT
Map of connect_phone_number_contact_flow_associations, attributes below
Required:
    - contact_flow_id
    - instance_id
    - phone_number_id
Optional:
    - region
EOT

  type = map(object({
    contact_flow_id = string
    instance_id     = string
    phone_number_id = string
    region          = optional(string)
  }))
}
