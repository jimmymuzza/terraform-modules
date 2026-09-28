resource "azurerm_automation_job_schedule" "automation_job_schedules" {
  for_each = var.automation_job_schedules

  automation_account_name = each.value.automation_account_name
  resource_group_name     = each.value.resource_group_name
  runbook_name            = each.value.runbook_name
  schedule_name           = each.value.schedule_name
  job_schedule_id         = each.value.job_schedule_id
  parameters              = each.value.parameters
  run_on                  = each.value.run_on
}
