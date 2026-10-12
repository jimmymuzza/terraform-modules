variable "static_web_app_function_app_registrations" {
  description = <<EOT
Map of static_web_app_function_app_registrations, attributes below
Required:
    - function_app_id
    - static_web_app_id
EOT

  type = map(object({
    function_app_id   = string
    static_web_app_id = string
  }))
}
