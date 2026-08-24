resource "aws_codegurureviewer_repository_association" "codegurureviewer_repository_associations" {
  for_each = var.codegurureviewer_repository_associations

  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all

  dynamic "kms_key_details" {
    for_each = each.value.kms_key_details != null ? each.value.kms_key_details : []
    content {
      encryption_option = kms_key_details.value.encryption_option
      kms_key_id        = kms_key_details.value.kms_key_id
    }
  }

  dynamic "repository" {
    for_each = each.value.repository != null ? each.value.repository : []
    content {

      dynamic "bitbucket" {
        for_each = repository.value.bitbucket != null ? repository.value.bitbucket : []
        content {
          connection_arn = bitbucket.value.connection_arn
          name           = bitbucket.value.name
          owner          = bitbucket.value.owner
        }
      }

      dynamic "codecommit" {
        for_each = repository.value.codecommit != null ? repository.value.codecommit : []
        content {
          name = codecommit.value.name
        }
      }

      dynamic "github_enterprise_server" {
        for_each = repository.value.github_enterprise_server != null ? repository.value.github_enterprise_server : []
        content {
          connection_arn = github_enterprise_server.value.connection_arn
          name           = github_enterprise_server.value.name
          owner          = github_enterprise_server.value.owner
        }
      }

      dynamic "s3_bucket" {
        for_each = repository.value.s3_bucket != null ? repository.value.s3_bucket : []
        content {
          bucket_name = s3_bucket.value.bucket_name
          name        = s3_bucket.value.name
        }
      }
    }
  }
}
