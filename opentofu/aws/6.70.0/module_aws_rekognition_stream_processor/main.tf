resource "aws_rekognition_stream_processor" "rekognition_stream_processors" {
  for_each = var.rekognition_stream_processors

  name       = each.value.name
  role_arn   = each.value.role_arn
  kms_key_id = each.value.kms_key_id
  region     = each.value.region
  tags       = each.value.tags

  dynamic "data_sharing_preference" {
    for_each = each.value.data_sharing_preference != null ? each.value.data_sharing_preference : []
    content {
      opt_in = data_sharing_preference.value.opt_in
    }
  }

  dynamic "input" {
    for_each = each.value.input != null ? each.value.input : []
    content {

      dynamic "kinesis_video_stream" {
        for_each = input.value.kinesis_video_stream != null ? input.value.kinesis_video_stream : []
        content {
          arn = kinesis_video_stream.value.arn
        }
      }
    }
  }

  dynamic "notification_channel" {
    for_each = each.value.notification_channel != null ? each.value.notification_channel : []
    content {
      sns_topic_arn = notification_channel.value.sns_topic_arn
    }
  }

  dynamic "output" {
    for_each = each.value.output != null ? each.value.output : []
    content {

      dynamic "kinesis_data_stream" {
        for_each = output.value.kinesis_data_stream != null ? output.value.kinesis_data_stream : []
        content {
          arn = kinesis_data_stream.value.arn
        }
      }

      dynamic "s3_destination" {
        for_each = output.value.s3_destination != null ? output.value.s3_destination : []
        content {
          bucket     = s3_destination.value.bucket
          key_prefix = s3_destination.value.key_prefix
        }
      }
    }
  }

  dynamic "regions_of_interest" {
    for_each = each.value.regions_of_interest != null ? each.value.regions_of_interest : []
    content {

      dynamic "bounding_box" {
        for_each = regions_of_interest.value.bounding_box != null ? regions_of_interest.value.bounding_box : []
        content {
          height = bounding_box.value.height
          left   = bounding_box.value.left
          top    = bounding_box.value.top
          width  = bounding_box.value.width
        }
      }

      dynamic "polygon" {
        for_each = regions_of_interest.value.polygon != null ? regions_of_interest.value.polygon : []
        content {
          x = polygon.value.x
          y = polygon.value.y
        }
      }
    }
  }

  dynamic "settings" {
    for_each = each.value.settings != null ? each.value.settings : []
    content {

      dynamic "connected_home" {
        for_each = settings.value.connected_home != null ? settings.value.connected_home : []
        content {
          labels         = connected_home.value.labels
          min_confidence = connected_home.value.min_confidence
        }
      }

      dynamic "face_search" {
        for_each = settings.value.face_search != null ? settings.value.face_search : []
        content {
          collection_id        = face_search.value.collection_id
          face_match_threshold = face_search.value.face_match_threshold
        }
      }
    }
  }
}
