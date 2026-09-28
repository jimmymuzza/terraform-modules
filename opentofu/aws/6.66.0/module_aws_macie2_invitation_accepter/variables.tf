variable "macie2_invitation_accepters" {
  description = <<EOT
Map of macie2_invitation_accepters, attributes below
Required:
    - administrator_account_id
Optional:
    - region
EOT

  type = map(object({
    administrator_account_id = string
    region                   = optional(string)
  }))
}
