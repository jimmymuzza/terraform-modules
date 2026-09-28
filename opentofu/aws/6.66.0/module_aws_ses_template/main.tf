resource "aws_ses_template" "ses_templates" {
  for_each = var.ses_templates

  name    = each.value.name
  html    = each.value.html
  region  = each.value.region
  subject = each.value.subject
  text    = each.value.text
}
