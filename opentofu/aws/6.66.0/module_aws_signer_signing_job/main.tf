resource "aws_signer_signing_job" "signer_signing_jobs" {
  for_each = var.signer_signing_jobs

  profile_name               = each.value.profile_name
  ignore_signing_job_failure = each.value.ignore_signing_job_failure
  region                     = each.value.region

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {

      dynamic "s3" {
        for_each = destination.value.s3 != null ? destination.value.s3 : []
        content {
          bucket = s3.value.bucket
          prefix = s3.value.prefix
        }
      }
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {

      dynamic "s3" {
        for_each = source.value.s3 != null ? source.value.s3 : []
        content {
          bucket  = s3.value.bucket
          key     = s3.value.key
          version = s3.value.version
        }
      }
    }
  }
}
