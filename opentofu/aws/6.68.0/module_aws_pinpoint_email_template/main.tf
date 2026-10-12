resource "aws_pinpoint_email_template" "pinpoint_email_templates" {
  for_each = var.pinpoint_email_templates

  template_name = each.value.template_name
  region        = each.value.region
  tags          = each.value.tags

  dynamic "email_template" {
    for_each = each.value.email_template != null ? each.value.email_template : []
    content {
      default_substitutions = email_template.value.default_substitutions
      description           = email_template.value.description
      html_part             = email_template.value.html_part
      recommender_id        = email_template.value.recommender_id
      subject               = email_template.value.subject
      text_part             = email_template.value.text_part

      dynamic "header" {
        for_each = email_template.value.header != null ? email_template.value.header : []
        content {
          name  = header.value.name
          value = header.value.value
        }
      }
    }
  }
}
