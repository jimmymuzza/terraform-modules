variable "logic_app_action_customs" {
  description = <<EOT
Map of logic_app_action_customs, attributes below
Required:
    - body
    - logic_app_id
    - name
EOT

  type = map(object({
    body         = string
    logic_app_id = string
    name         = string
  }))
}
