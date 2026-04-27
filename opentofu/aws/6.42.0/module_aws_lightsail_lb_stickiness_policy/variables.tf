variable "lightsail_lb_stickiness_policies" {
  description = <<EOT
Map of lightsail_lb_stickiness_policies, attributes below
Required:
    - cookie_duration
    - enabled
    - lb_name
Optional:
    - region
EOT

  type = map(object({
    cookie_duration = number
    enabled         = bool
    lb_name         = string
    region          = optional(string)
  }))
}
