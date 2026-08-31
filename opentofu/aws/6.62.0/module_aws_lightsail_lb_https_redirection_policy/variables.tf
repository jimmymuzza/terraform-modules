variable "lightsail_lb_https_redirection_policies" {
  description = <<EOT
Map of lightsail_lb_https_redirection_policies, attributes below
Required:
    - enabled
    - lb_name
Optional:
    - region
EOT

  type = map(object({
    enabled = bool
    lb_name = string
    region  = optional(string)
  }))
}
