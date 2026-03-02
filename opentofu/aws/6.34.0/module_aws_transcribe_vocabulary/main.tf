resource "aws_transcribe_vocabulary" "transcribe_vocabularies" {
  for_each = var.transcribe_vocabularies

  language_code       = each.value.language_code
  vocabulary_name     = each.value.vocabulary_name
  phrases             = each.value.phrases
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all
  vocabulary_file_uri = each.value.vocabulary_file_uri
}
