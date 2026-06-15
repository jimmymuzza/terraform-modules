resource "aws_codepipeline_webhook" "codepipeline_webhooks" {
  for_each = var.codepipeline_webhooks

  authentication  = each.value.authentication
  name            = each.value.name
  target_action   = each.value.target_action
  target_pipeline = each.value.target_pipeline
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all

  dynamic "authentication_configuration" {
    for_each = each.value.authentication_configuration != null ? each.value.authentication_configuration : []
    content {
      allowed_ip_range = authentication_configuration.value.allowed_ip_range
      secret_token     = authentication_configuration.value.secret_token
    }
  }

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      json_path    = filter.value.json_path
      match_equals = filter.value.match_equals
    }
  }
}
