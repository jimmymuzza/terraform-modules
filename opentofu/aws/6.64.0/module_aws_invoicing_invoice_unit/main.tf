resource "aws_invoicing_invoice_unit" "invoicing_invoice_units" {
  for_each = var.invoicing_invoice_units

  invoice_receiver         = each.value.invoice_receiver
  name                     = each.value.name
  description              = each.value.description
  region                   = each.value.region
  tags                     = each.value.tags
  tax_inheritance_disabled = each.value.tax_inheritance_disabled

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      linked_accounts = rule.value.linked_accounts
    }
  }
}
