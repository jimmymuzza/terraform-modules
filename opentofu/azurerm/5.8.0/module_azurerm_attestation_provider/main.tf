resource "azurerm_attestation_provider" "attestation_providers" {
  for_each = var.attestation_providers

  location                        = each.value.location
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  open_enclave_policy_base64      = each.value.open_enclave_policy_base64
  policy_signing_certificate_data = each.value.policy_signing_certificate_data
  sev_snp_policy_base64           = each.value.sev_snp_policy_base64
  sgx_enclave_policy_base64       = each.value.sgx_enclave_policy_base64
  tags                            = each.value.tags
  tpm_policy_base64               = each.value.tpm_policy_base64
}
