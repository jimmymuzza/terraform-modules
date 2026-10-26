variable "vmware_express_route_authorizations" {
  description = <<EOT
Map of vmware_express_route_authorizations, attributes below
Required:
    - name
    - private_cloud_id
EOT

  type = map(object({
    name             = string
    private_cloud_id = string
  }))
}
