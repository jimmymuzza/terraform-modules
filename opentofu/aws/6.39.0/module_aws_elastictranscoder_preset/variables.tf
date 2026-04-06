variable "elastictranscoder_presets" {
  description = <<EOT
Map of elastictranscoder_presets, attributes below
Required:
    - container
Optional:
    - description
    - name
    - region
    - type
    - video_codec_options
    - audio
    - audio_codec_options
    - thumbnails
    - video
    - video_watermarks
EOT

  type = map(object({
    container           = string
    description         = optional(string)
    name                = optional(string)
    region              = optional(string)
    type                = optional(string)
    video_codec_options = optional(map(string))
    audio               = optional(list(object({
            audio_packing_mode = optional(string)
            bit_rate           = optional(string)
            channels           = optional(string)
            codec              = optional(string)
            sample_rate        = optional(string)
        })))
    audio_codec_options = optional(list(object({
            bit_depth = optional(string)
            bit_order = optional(string)
            profile   = optional(string)
            signed    = optional(string)
        })))
    thumbnails          = optional(list(object({
            aspect_ratio   = optional(string)
            format         = optional(string)
            interval       = optional(string)
            max_height     = optional(string)
            max_width      = optional(string)
            padding_policy = optional(string)
            resolution     = optional(string)
            sizing_policy  = optional(string)
        })))
    video               = optional(list(object({
            aspect_ratio         = optional(string)
            bit_rate             = optional(string)
            codec                = optional(string)
            display_aspect_ratio = optional(string)
            fixed_gop            = optional(string)
            frame_rate           = optional(string)
            keyframes_max_dist   = optional(string)
            max_frame_rate       = optional(string)
            max_height           = optional(string)
            max_width            = optional(string)
            padding_policy       = optional(string)
            resolution           = optional(string)
            sizing_policy        = optional(string)
        })))
    video_watermarks    = optional(set(object({
            horizontal_align  = optional(string)
            horizontal_offset = optional(string)
            max_height        = optional(string)
            max_width         = optional(string)
            opacity           = optional(string)
            sizing_policy     = optional(string)
            target            = optional(string)
            vertical_align    = optional(string)
            vertical_offset   = optional(string)
        })))
  }))
}
