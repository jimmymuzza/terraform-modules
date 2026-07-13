resource "aws_route53recoveryreadiness_cell" "route53recoveryreadiness_cells" {
  for_each = var.route53recoveryreadiness_cells

  cell_name = each.value.cell_name
  cells     = each.value.cells
  tags      = each.value.tags
  tags_all  = each.value.tags_all
}
