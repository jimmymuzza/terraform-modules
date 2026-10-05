resource "aws_connect_bot_association" "connect_bot_associations" {
  for_each = var.connect_bot_associations

  instance_id = each.value.instance_id
  region      = each.value.region

  dynamic "lex_bot" {
    for_each = each.value.lex_bot != null ? each.value.lex_bot : []
    content {
      name       = lex_bot.value.name
      lex_region = lex_bot.value.lex_region
    }
  }
}
