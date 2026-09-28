variable "wafregional_ipsets" {
  description = <<EOT
Map of wafregional_ipsets, attributes below
Required:
    - name
Optional:
    - region
    - ip_set_descriptor
EOT

  type = map(object({
    name              = string
    region            = optional(string)
    ip_set_descriptor = optional(set(object({
            type  = string
            value = string
        })))
  }))
}
