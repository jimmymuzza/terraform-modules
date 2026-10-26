resource "aws_kms_ciphertext" "kms_ciphertexts" {
  for_each = var.kms_ciphertexts

  key_id               = each.value.key_id
  context              = each.value.context
  plaintext            = each.value.plaintext
  plaintext_wo         = each.value.plaintext_wo
  plaintext_wo_version = each.value.plaintext_wo_version
  region               = each.value.region
}
