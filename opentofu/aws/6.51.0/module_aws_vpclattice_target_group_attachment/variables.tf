variable "vpclattice_target_group_attachments" {
  description = <<EOT
Map of vpclattice_target_group_attachments, attributes below
Required:
    - target_group_identifier
    - target
Optional:
    - region
EOT

  type = map(object({
    target_group_identifier = string
    region                  = optional(string)
    target                  = list(object({
            port = optional(number)
        }))
  }))
}
