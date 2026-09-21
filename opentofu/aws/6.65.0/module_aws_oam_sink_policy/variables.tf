variable "oam_sink_policies" {
  description = <<EOT
Map of oam_sink_policies, attributes below
Required:
    - policy
    - sink_identifier
Optional:
    - region
EOT

  type = map(object({
    policy          = string
    sink_identifier = string
    region          = optional(string)
  }))
}
