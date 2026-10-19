resource "aws_servicequotas_auto_management" "servicequotas_auto_managements" {
  for_each = var.servicequotas_auto_managements

  opt_in_level     = each.value.opt_in_level
  opt_in_type      = each.value.opt_in_type
  exclusion_list   = each.value.exclusion_list
  notification_arn = each.value.notification_arn
  region           = each.value.region
}
