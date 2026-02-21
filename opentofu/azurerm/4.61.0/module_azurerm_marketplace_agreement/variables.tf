variable "marketplace_agreements" {
  description = <<EOT
Map of marketplace_agreements, attributes below
Required:
    - offer
    - plan
    - publisher
EOT

  type = map(object({
    offer     = string
    plan      = string
    publisher = string
  }))
}
