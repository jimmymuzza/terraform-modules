resource "aws_servicequotas_template_association" "servicequotas_template_associations" {
  for_each = var.servicequotas_template_associations

  region       = each.value.region
  skip_destroy = each.value.skip_destroy
}
