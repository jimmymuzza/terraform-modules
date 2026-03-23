resource "aws_verifiedaccess_instance_trust_provider_attachment" "verifiedaccess_instance_trust_provider_attachments" {
  for_each = var.verifiedaccess_instance_trust_provider_attachments

  verifiedaccess_instance_id       = each.value.verifiedaccess_instance_id
  verifiedaccess_trust_provider_id = each.value.verifiedaccess_trust_provider_id
  region                           = each.value.region
}
