variable "user_flow_attributes" {
  description = <<EOT
Map of user_flow_attributes, attributes below
Required:
    - data_type
    - description
    - display_name
EOT

  type = map(object({
    data_type    = string
    description  = string
    display_name = string
  }))
}
