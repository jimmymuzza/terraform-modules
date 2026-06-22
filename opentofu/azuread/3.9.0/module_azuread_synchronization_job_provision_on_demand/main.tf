resource "azuread_synchronization_job_provision_on_demand" "synchronization_job_provision_on_demands" {
  for_each = var.synchronization_job_provision_on_demands

  service_principal_id   = each.value.service_principal_id
  synchronization_job_id = each.value.synchronization_job_id
  triggers               = each.value.triggers

  dynamic "parameter" {
    for_each = each.value.parameter != null ? each.value.parameter : []
    content {
      rule_id = parameter.value.rule_id

      dynamic "subject" {
        for_each = parameter.value.subject != null ? parameter.value.subject : []
        content {
          object_id        = subject.value.object_id
          object_type_name = subject.value.object_type_name
        }
      }
    }
  }
}
