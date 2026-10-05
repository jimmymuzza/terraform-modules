variable "lightsail_lb_certificates" {
  description = <<EOT
Map of lightsail_lb_certificates, attributes below
Required:
    - lb_name
    - name
Optional:
    - domain_name
    - region
    - subject_alternative_names
EOT

  type = map(object({
    lb_name                   = string
    name                      = string
    domain_name               = optional(string)
    region                    = optional(string)
    subject_alternative_names = optional(set(string))
  }))
}
