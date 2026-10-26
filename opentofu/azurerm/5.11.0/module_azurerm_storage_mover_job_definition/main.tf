resource "azurerm_storage_mover_job_definition" "storage_mover_job_definitions" {
  for_each = var.storage_mover_job_definitions

  copy_mode                = each.value.copy_mode
  name                     = each.value.name
  source_name              = each.value.source_name
  storage_mover_project_id = each.value.storage_mover_project_id
  target_name              = each.value.target_name
  agent_name               = each.value.agent_name
  description              = each.value.description
  source_sub_path          = each.value.source_sub_path
  target_sub_path          = each.value.target_sub_path
}
