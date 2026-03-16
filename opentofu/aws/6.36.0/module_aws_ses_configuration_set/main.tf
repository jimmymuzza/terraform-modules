resource "aws_ses_configuration_set" "ses_configuration_sets" {
  for_each = var.ses_configuration_sets

  name                       = each.value.name
  region                     = each.value.region
  reputation_metrics_enabled = each.value.reputation_metrics_enabled
  sending_enabled            = each.value.sending_enabled

  dynamic "delivery_options" {
    for_each = each.value.delivery_options != null ? each.value.delivery_options : []
    content {
      tls_policy = delivery_options.value.tls_policy
    }
  }

  dynamic "tracking_options" {
    for_each = each.value.tracking_options != null ? each.value.tracking_options : []
    content {
      custom_redirect_domain = tracking_options.value.custom_redirect_domain
    }
  }
}
