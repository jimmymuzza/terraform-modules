resource "azurerm_spring_cloud_accelerator" "spring_cloud_accelerators" {
  for_each = var.spring_cloud_accelerators

  name                    = each.value.name
  spring_cloud_service_id = each.value.spring_cloud_service_id
}
