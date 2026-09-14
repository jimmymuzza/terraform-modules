variable "logic_app_trigger_http_requests" {
  description = <<EOT
Map of logic_app_trigger_http_requests, attributes below
Required:
    - logic_app_id
    - name
    - schema
Optional:
    - method
    - relative_path
EOT

  type = map(object({
    logic_app_id  = string
    name          = string
    schema        = string
    method        = optional(string)
    relative_path = optional(string)
  }))
}
