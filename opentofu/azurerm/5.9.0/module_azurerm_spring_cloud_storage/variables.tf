variable "spring_cloud_storages" {
  description = <<EOT
Map of spring_cloud_storages, attributes below
Required:
    - name
    - spring_cloud_service_id
    - storage_account_key
    - storage_account_name
EOT

  type = map(object({
    name                    = string
    spring_cloud_service_id = string
    storage_account_key     = string
    storage_account_name    = string
  }))
}
