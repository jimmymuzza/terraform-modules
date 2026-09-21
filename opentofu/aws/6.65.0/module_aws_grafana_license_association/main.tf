resource "aws_grafana_license_association" "grafana_license_associations" {
  for_each = var.grafana_license_associations

  license_type  = each.value.license_type
  workspace_id  = each.value.workspace_id
  grafana_token = each.value.grafana_token
  region        = each.value.region
}
