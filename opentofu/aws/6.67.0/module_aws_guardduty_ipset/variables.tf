variable "guardduty_ipsets" {
  description = <<EOT
Map of guardduty_ipsets, attributes below
Required:
    - activate
    - detector_id
    - format
    - location
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    activate    = bool
    detector_id = string
    format      = string
    location    = string
    name        = string
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
