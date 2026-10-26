variable "servicecatalog_organizations_accesses" {
  description = <<EOT
Map of servicecatalog_organizations_accesses, attributes below
Required:
    - enabled
EOT

  type = map(object({
    enabled = bool
  }))
}
