variable "mssql_server_dns_alias" {
  description = <<EOT
Map of mssql_server_dns_alias, attributes below
Required:
    - mssql_server_id
    - name
EOT

  type = map(object({
    mssql_server_id = string
    name            = string
  }))
}
