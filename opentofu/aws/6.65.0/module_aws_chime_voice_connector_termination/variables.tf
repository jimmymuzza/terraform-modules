variable "chime_voice_connector_terminations" {
  description = <<EOT
Map of chime_voice_connector_terminations, attributes below
Required:
    - calling_regions
    - cidr_allow_list
    - voice_connector_id
Optional:
    - cps_limit
    - default_phone_number
    - disabled
    - region
EOT

  type = map(object({
    calling_regions      = set(string)
    cidr_allow_list      = set(string)
    voice_connector_id   = string
    cps_limit            = optional(number)
    default_phone_number = optional(string)
    disabled             = optional(bool)
    region               = optional(string)
  }))
}
