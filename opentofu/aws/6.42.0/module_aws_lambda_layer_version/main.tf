resource "aws_lambda_layer_version" "lambda_layer_versions" {
  for_each = var.lambda_layer_versions

  layer_name               = each.value.layer_name
  compatible_architectures = each.value.compatible_architectures
  compatible_runtimes      = each.value.compatible_runtimes
  description              = each.value.description
  filename                 = each.value.filename
  license_info             = each.value.license_info
  region                   = each.value.region
  s3_bucket                = each.value.s3_bucket
  s3_key                   = each.value.s3_key
  s3_object_version        = each.value.s3_object_version
  skip_destroy             = each.value.skip_destroy
  source_code_hash         = each.value.source_code_hash
}
