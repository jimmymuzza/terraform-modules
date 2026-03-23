resource "aws_transcribe_vocabulary_filter" "transcribe_vocabulary_filters" {
  for_each = var.transcribe_vocabulary_filters

  language_code              = each.value.language_code
  vocabulary_filter_name     = each.value.vocabulary_filter_name
  region                     = each.value.region
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
  vocabulary_filter_file_uri = each.value.vocabulary_filter_file_uri
  words                      = each.value.words
}
