variable "lightsail_certificates" {
  description = <<EOT
Map of lightsail_certificates, attributes below
Required:
    - name
Optional:
    - domain_name
    - region
    - subject_alternative_names
    - tags
    - tags_all
EOT

  type = map(object({
    name                      = string
    domain_name               = optional(string)
    region                    = optional(string)
    subject_alternative_names = optional(set(string))
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
  }))
}
