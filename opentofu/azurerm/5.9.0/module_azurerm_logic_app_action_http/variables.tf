variable "logic_app_action_https" {
  description = <<EOT
Map of logic_app_action_https, attributes below
Required:
    - logic_app_id
    - method
    - name
    - uri
Optional:
    - body
    - headers
    - queries
    - run_after
EOT

  type = map(object({
    logic_app_id = string
    method       = string
    name         = string
    uri          = string
    body         = optional(string)
    headers      = optional(map(string))
    queries      = optional(map(string))
    run_after    = optional(set(object({
            action_name   = string
            action_result = string
        })))
  }))
}
