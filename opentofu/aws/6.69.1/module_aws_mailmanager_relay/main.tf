resource "aws_mailmanager_relay" "mailmanager_relays" {
  for_each = var.mailmanager_relays

  name        = each.value.name
  server_name = each.value.server_name
  server_port = each.value.server_port
  region      = each.value.region
  tags        = each.value.tags

  dynamic "authentication" {
    for_each = each.value.authentication != null ? each.value.authentication : []
    content {
      secret_arn = authentication.value.secret_arn

      dynamic "no_authentication" {
        for_each = authentication.value.no_authentication != null ? authentication.value.no_authentication : []
        content {
        }
      }
    }
  }
}
