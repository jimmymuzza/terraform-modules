resource "aws_transcribe_medical_vocabulary" "transcribe_medical_vocabularies" {
  for_each = var.transcribe_medical_vocabularies

  language_code       = each.value.language_code
  vocabulary_file_uri = each.value.vocabulary_file_uri
  vocabulary_name     = each.value.vocabulary_name
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all
}
