resource "azurerm_shared_image" "shared_images" {
  for_each = var.shared_images

  gallery_name                        = each.value.gallery_name
  location                            = each.value.location
  name                                = each.value.name
  os_type                             = each.value.os_type
  resource_group_name                 = each.value.resource_group_name
  accelerated_network_support_enabled = each.value.accelerated_network_support_enabled
  architecture                        = each.value.architecture
  confidential_vm_enabled             = each.value.confidential_vm_enabled
  confidential_vm_supported           = each.value.confidential_vm_supported
  description                         = each.value.description
  disk_controller_type_nvme_enabled   = each.value.disk_controller_type_nvme_enabled
  disk_types_not_allowed              = each.value.disk_types_not_allowed
  end_of_life_date                    = each.value.end_of_life_date
  eula                                = each.value.eula
  hibernation_enabled                 = each.value.hibernation_enabled
  hyper_v_generation                  = each.value.hyper_v_generation
  max_recommended_memory_in_gb        = each.value.max_recommended_memory_in_gb
  max_recommended_vcpu_count          = each.value.max_recommended_vcpu_count
  min_recommended_memory_in_gb        = each.value.min_recommended_memory_in_gb
  min_recommended_vcpu_count          = each.value.min_recommended_vcpu_count
  privacy_statement_uri               = each.value.privacy_statement_uri
  release_note_uri                    = each.value.release_note_uri
  specialized                         = each.value.specialized
  tags                                = each.value.tags
  trusted_launch_enabled              = each.value.trusted_launch_enabled
  trusted_launch_supported            = each.value.trusted_launch_supported

  dynamic "identifier" {
    for_each = each.value.identifier != null ? each.value.identifier : []
    content {
      offer     = identifier.value.offer
      publisher = identifier.value.publisher
      sku       = identifier.value.sku
    }
  }

  dynamic "purchase_plan" {
    for_each = each.value.purchase_plan != null ? each.value.purchase_plan : []
    content {
      name      = purchase_plan.value.name
      product   = purchase_plan.value.product
      publisher = purchase_plan.value.publisher
    }
  }
}
