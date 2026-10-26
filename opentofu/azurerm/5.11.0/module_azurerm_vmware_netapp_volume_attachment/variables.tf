variable "vmware_netapp_volume_attachments" {
  description = <<EOT
Map of vmware_netapp_volume_attachments, attributes below
Required:
    - name
    - netapp_volume_id
    - vmware_cluster_id
EOT

  type = map(object({
    name              = string
    netapp_volume_id  = string
    vmware_cluster_id = string
  }))
}
