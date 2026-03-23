resource "azurerm_virtual_desktop_host_pool" "virtual_desktop_host_pools" {
  for_each = var.virtual_desktop_host_pools

  load_balancer_type               = each.value.load_balancer_type
  location                         = each.value.location
  name                             = each.value.name
  resource_group_name              = each.value.resource_group_name
  type                             = each.value.type
  custom_rdp_properties            = each.value.custom_rdp_properties
  description                      = each.value.description
  friendly_name                    = each.value.friendly_name
  maximum_sessions_allowed         = each.value.maximum_sessions_allowed
  personal_desktop_assignment_type = each.value.personal_desktop_assignment_type
  preferred_app_group_type         = each.value.preferred_app_group_type
  public_network_access            = each.value.public_network_access
  start_vm_on_connect              = each.value.start_vm_on_connect
  tags                             = each.value.tags
  validate_environment             = each.value.validate_environment
  vm_template                      = each.value.vm_template

  dynamic "scheduled_agent_updates" {
    for_each = each.value.scheduled_agent_updates != null ? each.value.scheduled_agent_updates : []
    content {
      enabled                   = scheduled_agent_updates.value.enabled
      timezone                  = scheduled_agent_updates.value.timezone
      use_session_host_timezone = scheduled_agent_updates.value.use_session_host_timezone

      dynamic "schedule" {
        for_each = scheduled_agent_updates.value.schedule != null ? scheduled_agent_updates.value.schedule : []
        content {
          day_of_week = schedule.value.day_of_week
          hour_of_day = schedule.value.hour_of_day
        }
      }
    }
  }
}
