resource "aws_sagemaker_image_version" "sagemaker_image_versions" {
  for_each = var.sagemaker_image_versions

  base_image       = each.value.base_image
  image_name       = each.value.image_name
  aliases          = each.value.aliases
  horovod          = each.value.horovod
  job_type         = each.value.job_type
  ml_framework     = each.value.ml_framework
  processor        = each.value.processor
  programming_lang = each.value.programming_lang
  region           = each.value.region
  release_notes    = each.value.release_notes
  vendor_guidance  = each.value.vendor_guidance
}
