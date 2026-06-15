resource "aws_elastictranscoder_preset" "elastictranscoder_presets" {
  for_each = var.elastictranscoder_presets

  container           = each.value.container
  description         = each.value.description
  name                = each.value.name
  region              = each.value.region
  type                = each.value.type
  video_codec_options = each.value.video_codec_options

  dynamic "audio" {
    for_each = each.value.audio != null ? each.value.audio : []
    content {
      audio_packing_mode = audio.value.audio_packing_mode
      bit_rate           = audio.value.bit_rate
      channels           = audio.value.channels
      codec              = audio.value.codec
      sample_rate        = audio.value.sample_rate
    }
  }

  dynamic "audio_codec_options" {
    for_each = each.value.audio_codec_options != null ? each.value.audio_codec_options : []
    content {
      bit_depth = audio_codec_options.value.bit_depth
      bit_order = audio_codec_options.value.bit_order
      profile   = audio_codec_options.value.profile
      signed    = audio_codec_options.value.signed
    }
  }

  dynamic "thumbnails" {
    for_each = each.value.thumbnails != null ? each.value.thumbnails : []
    content {
      aspect_ratio   = thumbnails.value.aspect_ratio
      format         = thumbnails.value.format
      interval       = thumbnails.value.interval
      max_height     = thumbnails.value.max_height
      max_width      = thumbnails.value.max_width
      padding_policy = thumbnails.value.padding_policy
      resolution     = thumbnails.value.resolution
      sizing_policy  = thumbnails.value.sizing_policy
    }
  }

  dynamic "video" {
    for_each = each.value.video != null ? each.value.video : []
    content {
      aspect_ratio         = video.value.aspect_ratio
      bit_rate             = video.value.bit_rate
      codec                = video.value.codec
      display_aspect_ratio = video.value.display_aspect_ratio
      fixed_gop            = video.value.fixed_gop
      frame_rate           = video.value.frame_rate
      keyframes_max_dist   = video.value.keyframes_max_dist
      max_frame_rate       = video.value.max_frame_rate
      max_height           = video.value.max_height
      max_width            = video.value.max_width
      padding_policy       = video.value.padding_policy
      resolution           = video.value.resolution
      sizing_policy        = video.value.sizing_policy
    }
  }

  dynamic "video_watermarks" {
    for_each = each.value.video_watermarks != null ? each.value.video_watermarks : []
    content {
      horizontal_align  = video_watermarks.value.horizontal_align
      horizontal_offset = video_watermarks.value.horizontal_offset
      max_height        = video_watermarks.value.max_height
      max_width         = video_watermarks.value.max_width
      opacity           = video_watermarks.value.opacity
      sizing_policy     = video_watermarks.value.sizing_policy
      target            = video_watermarks.value.target
      vertical_align    = video_watermarks.value.vertical_align
      vertical_offset   = video_watermarks.value.vertical_offset
    }
  }
}
