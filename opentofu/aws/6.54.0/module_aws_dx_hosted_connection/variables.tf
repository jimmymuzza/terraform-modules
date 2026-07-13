variable "dx_hosted_connections" {
  description = <<EOT
Map of dx_hosted_connections, attributes below
Required:
    - bandwidth
    - connection_id
    - name
    - owner_account_id
    - vlan
EOT

  type = map(object({
    bandwidth        = string
    connection_id    = string
    name             = string
    owner_account_id = string
    vlan             = number
  }))
}
