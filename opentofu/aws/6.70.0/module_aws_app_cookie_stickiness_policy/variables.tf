variable "app_cookie_stickiness_policies" {
  description = <<EOT
Map of app_cookie_stickiness_policies, attributes below
Required:
    - cookie_name
    - lb_port
    - load_balancer
    - name
Optional:
    - region
EOT

  type = map(object({
    cookie_name   = string
    lb_port       = number
    load_balancer = string
    name          = string
    region        = optional(string)
  }))
}
