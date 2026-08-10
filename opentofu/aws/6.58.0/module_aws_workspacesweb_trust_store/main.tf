resource "aws_workspacesweb_trust_store" "workspacesweb_trust_stores" {
  for_each = var.workspacesweb_trust_stores

  region = each.value.region
  tags   = each.value.tags

  dynamic "certificate" {
    for_each = each.value.certificate != null ? each.value.certificate : []
    content {
      body = certificate.value.body
    }
  }
}
