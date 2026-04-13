resource "azurerm_vmware_netapp_volume_attachment" "vmware_netapp_volume_attachments" {
  for_each = var.vmware_netapp_volume_attachments

  name              = each.value.name
  netapp_volume_id  = each.value.netapp_volume_id
  vmware_cluster_id = each.value.vmware_cluster_id
}
