variable "attestation_providers" {
  description = <<EOT
Map of attestation_providers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - open_enclave_policy_base64
    - policy_signing_certificate_data
    - sev_snp_policy_base64
    - sgx_enclave_policy_base64
    - tags
    - tpm_policy_base64
EOT

  type = map(object({
    location                        = string
    name                            = string
    resource_group_name             = string
    open_enclave_policy_base64      = optional(string)
    policy_signing_certificate_data = optional(string)
    sev_snp_policy_base64           = optional(string)
    sgx_enclave_policy_base64       = optional(string)
    tags                            = optional(map(string))
    tpm_policy_base64               = optional(string)
  }))
}
