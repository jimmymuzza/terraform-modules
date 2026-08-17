resource "aws_medialive_channel" "medialive_channels" {
  for_each = var.medialive_channels

  channel_class = each.value.channel_class
  name          = each.value.name
  log_level     = each.value.log_level
  region        = each.value.region
  role_arn      = each.value.role_arn
  start_channel = each.value.start_channel
  tags          = each.value.tags
  tags_all      = each.value.tags_all

  dynamic "cdi_input_specification" {
    for_each = each.value.cdi_input_specification != null ? each.value.cdi_input_specification : []
    content {
      resolution = cdi_input_specification.value.resolution
    }
  }

  dynamic "destinations" {
    for_each = each.value.destinations != null ? each.value.destinations : []
    content {

      dynamic "media_package_settings" {
        for_each = destinations.value.media_package_settings != null ? destinations.value.media_package_settings : []
        content {
          channel_id = media_package_settings.value.channel_id
        }
      }

      dynamic "multiplex_settings" {
        for_each = destinations.value.multiplex_settings != null ? destinations.value.multiplex_settings : []
        content {
          multiplex_id = multiplex_settings.value.multiplex_id
          program_name = multiplex_settings.value.program_name
        }
      }

      dynamic "settings" {
        for_each = destinations.value.settings != null ? destinations.value.settings : []
        content {
          password_param = settings.value.password_param
          stream_name    = settings.value.stream_name
          url            = settings.value.url
          username       = settings.value.username
        }
      }
    }
  }

  dynamic "encoder_settings" {
    for_each = each.value.encoder_settings != null ? each.value.encoder_settings : []
    content {

      dynamic "audio_descriptions" {
        for_each = encoder_settings.value.audio_descriptions != null ? encoder_settings.value.audio_descriptions : []
        content {
          audio_selector_name   = audio_descriptions.value.audio_selector_name
          name                  = audio_descriptions.value.name
          audio_type            = audio_descriptions.value.audio_type
          audio_type_control    = audio_descriptions.value.audio_type_control
          language_code         = audio_descriptions.value.language_code
          language_code_control = audio_descriptions.value.language_code_control
          stream_name           = audio_descriptions.value.stream_name

          dynamic "audio_normalization_settings" {
            for_each = audio_descriptions.value.audio_normalization_settings != null ? audio_descriptions.value.audio_normalization_settings : []
            content {
              algorithm         = audio_normalization_settings.value.algorithm
              algorithm_control = audio_normalization_settings.value.algorithm_control
              target_lkfs       = audio_normalization_settings.value.target_lkfs
            }
          }

          dynamic "audio_watermark_settings" {
            for_each = audio_descriptions.value.audio_watermark_settings != null ? audio_descriptions.value.audio_watermark_settings : []
            content {

              dynamic "nielsen_watermarks_settings" {
                for_each = audio_watermark_settings.value.nielsen_watermarks_settings != null ? audio_watermark_settings.value.nielsen_watermarks_settings : []
                content {
                  nielsen_distribution_type = nielsen_watermarks_settings.value.nielsen_distribution_type

                  dynamic "nielsen_cbet_settings" {
                    for_each = nielsen_watermarks_settings.value.nielsen_cbet_settings != null ? nielsen_watermarks_settings.value.nielsen_cbet_settings : []
                    content {
                      cbet_check_digit_string = nielsen_cbet_settings.value.cbet_check_digit_string
                      cbet_stepaside          = nielsen_cbet_settings.value.cbet_stepaside
                      csid                    = nielsen_cbet_settings.value.csid
                    }
                  }

                  dynamic "nielsen_naes_ii_nw_settings" {
                    for_each = nielsen_watermarks_settings.value.nielsen_naes_ii_nw_settings != null ? nielsen_watermarks_settings.value.nielsen_naes_ii_nw_settings : []
                    content {
                      check_digit_string = nielsen_naes_ii_nw_settings.value.check_digit_string
                      sid                = nielsen_naes_ii_nw_settings.value.sid
                    }
                  }
                }
              }
            }
          }

          dynamic "codec_settings" {
            for_each = audio_descriptions.value.codec_settings != null ? audio_descriptions.value.codec_settings : []
            content {

              dynamic "aac_settings" {
                for_each = codec_settings.value.aac_settings != null ? codec_settings.value.aac_settings : []
                content {
                  bitrate           = aac_settings.value.bitrate
                  coding_mode       = aac_settings.value.coding_mode
                  input_type        = aac_settings.value.input_type
                  profile           = aac_settings.value.profile
                  rate_control_mode = aac_settings.value.rate_control_mode
                  raw_format        = aac_settings.value.raw_format
                  sample_rate       = aac_settings.value.sample_rate
                  spec              = aac_settings.value.spec
                  vbr_quality       = aac_settings.value.vbr_quality
                }
              }

              dynamic "ac3_settings" {
                for_each = codec_settings.value.ac3_settings != null ? codec_settings.value.ac3_settings : []
                content {
                  bitrate          = ac3_settings.value.bitrate
                  bitstream_mode   = ac3_settings.value.bitstream_mode
                  coding_mode      = ac3_settings.value.coding_mode
                  dialnorm         = ac3_settings.value.dialnorm
                  drc_profile      = ac3_settings.value.drc_profile
                  lfe_filter       = ac3_settings.value.lfe_filter
                  metadata_control = ac3_settings.value.metadata_control
                }
              }

              dynamic "eac3_atmos_settings" {
                for_each = codec_settings.value.eac3_atmos_settings != null ? codec_settings.value.eac3_atmos_settings : []
                content {
                  bitrate       = eac3_atmos_settings.value.bitrate
                  coding_mode   = eac3_atmos_settings.value.coding_mode
                  dialnorm      = eac3_atmos_settings.value.dialnorm
                  drc_line      = eac3_atmos_settings.value.drc_line
                  drc_rf        = eac3_atmos_settings.value.drc_rf
                  height_trim   = eac3_atmos_settings.value.height_trim
                  surround_trim = eac3_atmos_settings.value.surround_trim
                }
              }

              dynamic "eac3_settings" {
                for_each = codec_settings.value.eac3_settings != null ? codec_settings.value.eac3_settings : []
                content {
                  attenuation_control      = eac3_settings.value.attenuation_control
                  bitrate                  = eac3_settings.value.bitrate
                  bitstream_mode           = eac3_settings.value.bitstream_mode
                  coding_mode              = eac3_settings.value.coding_mode
                  dc_filter                = eac3_settings.value.dc_filter
                  dialnorm                 = eac3_settings.value.dialnorm
                  drc_line                 = eac3_settings.value.drc_line
                  drc_rf                   = eac3_settings.value.drc_rf
                  lfe_control              = eac3_settings.value.lfe_control
                  lfe_filter               = eac3_settings.value.lfe_filter
                  lo_ro_center_mix_level   = eac3_settings.value.lo_ro_center_mix_level
                  lo_ro_surround_mix_level = eac3_settings.value.lo_ro_surround_mix_level
                  lt_rt_center_mix_level   = eac3_settings.value.lt_rt_center_mix_level
                  lt_rt_surround_mix_level = eac3_settings.value.lt_rt_surround_mix_level
                  metadata_control         = eac3_settings.value.metadata_control
                  passthrough_control      = eac3_settings.value.passthrough_control
                  phase_control            = eac3_settings.value.phase_control
                  stereo_downmix           = eac3_settings.value.stereo_downmix
                  surround_ex_mode         = eac3_settings.value.surround_ex_mode
                  surround_mode            = eac3_settings.value.surround_mode
                }
              }

              dynamic "mp2_settings" {
                for_each = codec_settings.value.mp2_settings != null ? codec_settings.value.mp2_settings : []
                content {
                  bitrate     = mp2_settings.value.bitrate
                  coding_mode = mp2_settings.value.coding_mode
                  sample_rate = mp2_settings.value.sample_rate
                }
              }

              dynamic "pass_through_settings" {
                for_each = codec_settings.value.pass_through_settings != null ? codec_settings.value.pass_through_settings : []
                content {
                }
              }

              dynamic "wav_settings" {
                for_each = codec_settings.value.wav_settings != null ? codec_settings.value.wav_settings : []
                content {
                  bit_depth   = wav_settings.value.bit_depth
                  coding_mode = wav_settings.value.coding_mode
                  sample_rate = wav_settings.value.sample_rate
                }
              }
            }
          }

          dynamic "remix_settings" {
            for_each = audio_descriptions.value.remix_settings != null ? audio_descriptions.value.remix_settings : []
            content {
              channels_in  = remix_settings.value.channels_in
              channels_out = remix_settings.value.channels_out

              dynamic "channel_mappings" {
                for_each = remix_settings.value.channel_mappings != null ? remix_settings.value.channel_mappings : []
                content {
                  output_channel = channel_mappings.value.output_channel

                  dynamic "input_channel_levels" {
                    for_each = channel_mappings.value.input_channel_levels != null ? channel_mappings.value.input_channel_levels : []
                    content {
                      gain          = input_channel_levels.value.gain
                      input_channel = input_channel_levels.value.input_channel
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "avail_blanking" {
        for_each = encoder_settings.value.avail_blanking != null ? encoder_settings.value.avail_blanking : []
        content {
          state = avail_blanking.value.state

          dynamic "avail_blanking_image" {
            for_each = avail_blanking.value.avail_blanking_image != null ? avail_blanking.value.avail_blanking_image : []
            content {
              uri            = avail_blanking_image.value.uri
              password_param = avail_blanking_image.value.password_param
              username       = avail_blanking_image.value.username
            }
          }
        }
      }

      dynamic "caption_descriptions" {
        for_each = encoder_settings.value.caption_descriptions != null ? encoder_settings.value.caption_descriptions : []
        content {
          caption_selector_name = caption_descriptions.value.caption_selector_name
          name                  = caption_descriptions.value.name
          accessibility         = caption_descriptions.value.accessibility
          language_code         = caption_descriptions.value.language_code
          language_description  = caption_descriptions.value.language_description

          dynamic "destination_settings" {
            for_each = caption_descriptions.value.destination_settings != null ? caption_descriptions.value.destination_settings : []
            content {

              dynamic "arib_destination_settings" {
                for_each = destination_settings.value.arib_destination_settings != null ? destination_settings.value.arib_destination_settings : []
                content {
                }
              }

              dynamic "burn_in_destination_settings" {
                for_each = destination_settings.value.burn_in_destination_settings != null ? destination_settings.value.burn_in_destination_settings : []
                content {
                  outline_color         = burn_in_destination_settings.value.outline_color
                  teletext_grid_control = burn_in_destination_settings.value.teletext_grid_control
                  alignment             = burn_in_destination_settings.value.alignment
                  background_color      = burn_in_destination_settings.value.background_color
                  background_opacity    = burn_in_destination_settings.value.background_opacity
                  font_color            = burn_in_destination_settings.value.font_color
                  font_opacity          = burn_in_destination_settings.value.font_opacity
                  font_resolution       = burn_in_destination_settings.value.font_resolution
                  font_size             = burn_in_destination_settings.value.font_size
                  outline_size          = burn_in_destination_settings.value.outline_size
                  shadow_color          = burn_in_destination_settings.value.shadow_color
                  shadow_opacity        = burn_in_destination_settings.value.shadow_opacity
                  shadow_x_offset       = burn_in_destination_settings.value.shadow_x_offset
                  shadow_y_offset       = burn_in_destination_settings.value.shadow_y_offset
                  x_position            = burn_in_destination_settings.value.x_position
                  y_position            = burn_in_destination_settings.value.y_position

                  dynamic "font" {
                    for_each = burn_in_destination_settings.value.font != null ? burn_in_destination_settings.value.font : []
                    content {
                      uri            = font.value.uri
                      password_param = font.value.password_param
                      username       = font.value.username
                    }
                  }
                }
              }

              dynamic "dvb_sub_destination_settings" {
                for_each = destination_settings.value.dvb_sub_destination_settings != null ? destination_settings.value.dvb_sub_destination_settings : []
                content {
                  alignment             = dvb_sub_destination_settings.value.alignment
                  background_color      = dvb_sub_destination_settings.value.background_color
                  background_opacity    = dvb_sub_destination_settings.value.background_opacity
                  font_color            = dvb_sub_destination_settings.value.font_color
                  font_opacity          = dvb_sub_destination_settings.value.font_opacity
                  font_resolution       = dvb_sub_destination_settings.value.font_resolution
                  font_size             = dvb_sub_destination_settings.value.font_size
                  outline_color         = dvb_sub_destination_settings.value.outline_color
                  outline_size          = dvb_sub_destination_settings.value.outline_size
                  shadow_color          = dvb_sub_destination_settings.value.shadow_color
                  shadow_opacity        = dvb_sub_destination_settings.value.shadow_opacity
                  shadow_x_offset       = dvb_sub_destination_settings.value.shadow_x_offset
                  shadow_y_offset       = dvb_sub_destination_settings.value.shadow_y_offset
                  teletext_grid_control = dvb_sub_destination_settings.value.teletext_grid_control
                  x_position            = dvb_sub_destination_settings.value.x_position
                  y_position            = dvb_sub_destination_settings.value.y_position

                  dynamic "font" {
                    for_each = dvb_sub_destination_settings.value.font != null ? dvb_sub_destination_settings.value.font : []
                    content {
                      uri            = font.value.uri
                      password_param = font.value.password_param
                      username       = font.value.username
                    }
                  }
                }
              }

              dynamic "ebu_tt_d_destination_settings" {
                for_each = destination_settings.value.ebu_tt_d_destination_settings != null ? destination_settings.value.ebu_tt_d_destination_settings : []
                content {
                  copyright_holder = ebu_tt_d_destination_settings.value.copyright_holder
                  fill_line_gap    = ebu_tt_d_destination_settings.value.fill_line_gap
                  font_family      = ebu_tt_d_destination_settings.value.font_family
                  style_control    = ebu_tt_d_destination_settings.value.style_control
                }
              }

              dynamic "embedded_destination_settings" {
                for_each = destination_settings.value.embedded_destination_settings != null ? destination_settings.value.embedded_destination_settings : []
                content {
                }
              }

              dynamic "embedded_plus_scte20_destination_settings" {
                for_each = destination_settings.value.embedded_plus_scte20_destination_settings != null ? destination_settings.value.embedded_plus_scte20_destination_settings : []
                content {
                }
              }

              dynamic "rtmp_caption_info_destination_settings" {
                for_each = destination_settings.value.rtmp_caption_info_destination_settings != null ? destination_settings.value.rtmp_caption_info_destination_settings : []
                content {
                }
              }

              dynamic "scte20_plus_embedded_destination_settings" {
                for_each = destination_settings.value.scte20_plus_embedded_destination_settings != null ? destination_settings.value.scte20_plus_embedded_destination_settings : []
                content {
                }
              }

              dynamic "scte27_destination_settings" {
                for_each = destination_settings.value.scte27_destination_settings != null ? destination_settings.value.scte27_destination_settings : []
                content {
                }
              }

              dynamic "smpte_tt_destination_settings" {
                for_each = destination_settings.value.smpte_tt_destination_settings != null ? destination_settings.value.smpte_tt_destination_settings : []
                content {
                }
              }

              dynamic "teletext_destination_settings" {
                for_each = destination_settings.value.teletext_destination_settings != null ? destination_settings.value.teletext_destination_settings : []
                content {
                }
              }

              dynamic "ttml_destination_settings" {
                for_each = destination_settings.value.ttml_destination_settings != null ? destination_settings.value.ttml_destination_settings : []
                content {
                  style_control = ttml_destination_settings.value.style_control
                }
              }

              dynamic "webvtt_destination_settings" {
                for_each = destination_settings.value.webvtt_destination_settings != null ? destination_settings.value.webvtt_destination_settings : []
                content {
                  style_control = webvtt_destination_settings.value.style_control
                }
              }
            }
          }
        }
      }

      dynamic "global_configuration" {
        for_each = encoder_settings.value.global_configuration != null ? encoder_settings.value.global_configuration : []
        content {
          initial_audio_gain           = global_configuration.value.initial_audio_gain
          input_end_action             = global_configuration.value.input_end_action
          output_locking_mode          = global_configuration.value.output_locking_mode
          output_timing_source         = global_configuration.value.output_timing_source
          support_low_framerate_inputs = global_configuration.value.support_low_framerate_inputs

          dynamic "input_loss_behavior" {
            for_each = global_configuration.value.input_loss_behavior != null ? global_configuration.value.input_loss_behavior : []
            content {
              black_frame_msec       = input_loss_behavior.value.black_frame_msec
              input_loss_image_color = input_loss_behavior.value.input_loss_image_color
              input_loss_image_type  = input_loss_behavior.value.input_loss_image_type
              repeat_frame_msec      = input_loss_behavior.value.repeat_frame_msec

              dynamic "input_loss_image_slate" {
                for_each = input_loss_behavior.value.input_loss_image_slate != null ? input_loss_behavior.value.input_loss_image_slate : []
                content {
                  uri            = input_loss_image_slate.value.uri
                  password_param = input_loss_image_slate.value.password_param
                  username       = input_loss_image_slate.value.username
                }
              }
            }
          }
        }
      }

      dynamic "motion_graphics_configuration" {
        for_each = encoder_settings.value.motion_graphics_configuration != null ? encoder_settings.value.motion_graphics_configuration : []
        content {
          motion_graphics_insertion = motion_graphics_configuration.value.motion_graphics_insertion

          dynamic "motion_graphics_settings" {
            for_each = motion_graphics_configuration.value.motion_graphics_settings != null ? motion_graphics_configuration.value.motion_graphics_settings : []
            content {

              dynamic "html_motion_graphics_settings" {
                for_each = motion_graphics_settings.value.html_motion_graphics_settings != null ? motion_graphics_settings.value.html_motion_graphics_settings : []
                content {
                }
              }
            }
          }
        }
      }

      dynamic "nielsen_configuration" {
        for_each = encoder_settings.value.nielsen_configuration != null ? encoder_settings.value.nielsen_configuration : []
        content {
          distributor_id             = nielsen_configuration.value.distributor_id
          nielsen_pcm_to_id3_tagging = nielsen_configuration.value.nielsen_pcm_to_id3_tagging
        }
      }

      dynamic "output_groups" {
        for_each = encoder_settings.value.output_groups != null ? encoder_settings.value.output_groups : []
        content {
          name = output_groups.value.name

          dynamic "output_group_settings" {
            for_each = output_groups.value.output_group_settings != null ? output_groups.value.output_group_settings : []
            content {

              dynamic "archive_group_settings" {
                for_each = output_group_settings.value.archive_group_settings != null ? output_group_settings.value.archive_group_settings : []
                content {
                  rollover_interval = archive_group_settings.value.rollover_interval

                  dynamic "archive_cdn_settings" {
                    for_each = archive_group_settings.value.archive_cdn_settings != null ? archive_group_settings.value.archive_cdn_settings : []
                    content {

                      dynamic "archive_s3_settings" {
                        for_each = archive_cdn_settings.value.archive_s3_settings != null ? archive_cdn_settings.value.archive_s3_settings : []
                        content {
                          canned_acl = archive_s3_settings.value.canned_acl
                        }
                      }
                    }
                  }

                  dynamic "destination" {
                    for_each = archive_group_settings.value.destination != null ? archive_group_settings.value.destination : []
                    content {
                      destination_ref_id = destination.value.destination_ref_id
                    }
                  }
                }
              }

              dynamic "frame_capture_group_settings" {
                for_each = output_group_settings.value.frame_capture_group_settings != null ? output_group_settings.value.frame_capture_group_settings : []
                content {

                  dynamic "destination" {
                    for_each = frame_capture_group_settings.value.destination != null ? frame_capture_group_settings.value.destination : []
                    content {
                      destination_ref_id = destination.value.destination_ref_id
                    }
                  }

                  dynamic "frame_capture_cdn_settings" {
                    for_each = frame_capture_group_settings.value.frame_capture_cdn_settings != null ? frame_capture_group_settings.value.frame_capture_cdn_settings : []
                    content {

                      dynamic "frame_capture_s3_settings" {
                        for_each = frame_capture_cdn_settings.value.frame_capture_s3_settings != null ? frame_capture_cdn_settings.value.frame_capture_s3_settings : []
                        content {
                          canned_acl = frame_capture_s3_settings.value.canned_acl
                        }
                      }
                    }
                  }
                }
              }

              dynamic "hls_group_settings" {
                for_each = output_group_settings.value.hls_group_settings != null ? output_group_settings.value.hls_group_settings : []
                content {
                  ad_markers                   = hls_group_settings.value.ad_markers
                  base_url_content             = hls_group_settings.value.base_url_content
                  base_url_content1            = hls_group_settings.value.base_url_content1
                  base_url_manifest            = hls_group_settings.value.base_url_manifest
                  base_url_manifest1           = hls_group_settings.value.base_url_manifest1
                  caption_language_setting     = hls_group_settings.value.caption_language_setting
                  client_cache                 = hls_group_settings.value.client_cache
                  codec_specification          = hls_group_settings.value.codec_specification
                  constant_iv                  = hls_group_settings.value.constant_iv
                  directory_structure          = hls_group_settings.value.directory_structure
                  discontinuity_tags           = hls_group_settings.value.discontinuity_tags
                  encryption_type              = hls_group_settings.value.encryption_type
                  hls_id3_segment_tagging      = hls_group_settings.value.hls_id3_segment_tagging
                  iframe_only_playlists        = hls_group_settings.value.iframe_only_playlists
                  incomplete_segment_behavior  = hls_group_settings.value.incomplete_segment_behavior
                  index_n_segments             = hls_group_settings.value.index_n_segments
                  input_loss_action            = hls_group_settings.value.input_loss_action
                  iv_in_manifest               = hls_group_settings.value.iv_in_manifest
                  iv_source                    = hls_group_settings.value.iv_source
                  keep_segments                = hls_group_settings.value.keep_segments
                  key_format                   = hls_group_settings.value.key_format
                  key_format_versions          = hls_group_settings.value.key_format_versions
                  manifest_compression         = hls_group_settings.value.manifest_compression
                  manifest_duration_format     = hls_group_settings.value.manifest_duration_format
                  min_segment_length           = hls_group_settings.value.min_segment_length
                  mode                         = hls_group_settings.value.mode
                  output_selection             = hls_group_settings.value.output_selection
                  program_date_time            = hls_group_settings.value.program_date_time
                  program_date_time_clock      = hls_group_settings.value.program_date_time_clock
                  program_date_time_period     = hls_group_settings.value.program_date_time_period
                  redundant_manifest           = hls_group_settings.value.redundant_manifest
                  segment_length               = hls_group_settings.value.segment_length
                  segments_per_subdirectory    = hls_group_settings.value.segments_per_subdirectory
                  stream_inf_resolution        = hls_group_settings.value.stream_inf_resolution
                  timed_metadata_id3_frame     = hls_group_settings.value.timed_metadata_id3_frame
                  timed_metadata_id3_period    = hls_group_settings.value.timed_metadata_id3_period
                  timestamp_delta_milliseconds = hls_group_settings.value.timestamp_delta_milliseconds
                  ts_file_mode                 = hls_group_settings.value.ts_file_mode

                  dynamic "caption_language_mappings" {
                    for_each = hls_group_settings.value.caption_language_mappings != null ? hls_group_settings.value.caption_language_mappings : []
                    content {
                      caption_channel      = caption_language_mappings.value.caption_channel
                      language_code        = caption_language_mappings.value.language_code
                      language_description = caption_language_mappings.value.language_description
                    }
                  }

                  dynamic "destination" {
                    for_each = hls_group_settings.value.destination != null ? hls_group_settings.value.destination : []
                    content {
                      destination_ref_id = destination.value.destination_ref_id
                    }
                  }

                  dynamic "hls_cdn_settings" {
                    for_each = hls_group_settings.value.hls_cdn_settings != null ? hls_group_settings.value.hls_cdn_settings : []
                    content {

                      dynamic "hls_akamai_settings" {
                        for_each = hls_cdn_settings.value.hls_akamai_settings != null ? hls_cdn_settings.value.hls_akamai_settings : []
                        content {
                          connection_retry_interval = hls_akamai_settings.value.connection_retry_interval
                          filecache_duration        = hls_akamai_settings.value.filecache_duration
                          http_transfer_mode        = hls_akamai_settings.value.http_transfer_mode
                          num_retries               = hls_akamai_settings.value.num_retries
                          restart_delay             = hls_akamai_settings.value.restart_delay
                          salt                      = hls_akamai_settings.value.salt
                          token                     = hls_akamai_settings.value.token
                        }
                      }

                      dynamic "hls_basic_put_settings" {
                        for_each = hls_cdn_settings.value.hls_basic_put_settings != null ? hls_cdn_settings.value.hls_basic_put_settings : []
                        content {
                          connection_retry_interval = hls_basic_put_settings.value.connection_retry_interval
                          filecache_duration        = hls_basic_put_settings.value.filecache_duration
                          num_retries               = hls_basic_put_settings.value.num_retries
                          restart_delay             = hls_basic_put_settings.value.restart_delay
                        }
                      }

                      dynamic "hls_media_store_settings" {
                        for_each = hls_cdn_settings.value.hls_media_store_settings != null ? hls_cdn_settings.value.hls_media_store_settings : []
                        content {
                          connection_retry_interval = hls_media_store_settings.value.connection_retry_interval
                          filecache_duration        = hls_media_store_settings.value.filecache_duration
                          media_store_storage_class = hls_media_store_settings.value.media_store_storage_class
                          num_retries               = hls_media_store_settings.value.num_retries
                          restart_delay             = hls_media_store_settings.value.restart_delay
                        }
                      }

                      dynamic "hls_s3_settings" {
                        for_each = hls_cdn_settings.value.hls_s3_settings != null ? hls_cdn_settings.value.hls_s3_settings : []
                        content {
                          canned_acl = hls_s3_settings.value.canned_acl
                        }
                      }

                      dynamic "hls_webdav_settings" {
                        for_each = hls_cdn_settings.value.hls_webdav_settings != null ? hls_cdn_settings.value.hls_webdav_settings : []
                        content {
                          connection_retry_interval = hls_webdav_settings.value.connection_retry_interval
                          filecache_duration        = hls_webdav_settings.value.filecache_duration
                          http_transfer_mode        = hls_webdav_settings.value.http_transfer_mode
                          num_retries               = hls_webdav_settings.value.num_retries
                          restart_delay             = hls_webdav_settings.value.restart_delay
                        }
                      }
                    }
                  }

                  dynamic "key_provider_settings" {
                    for_each = hls_group_settings.value.key_provider_settings != null ? hls_group_settings.value.key_provider_settings : []
                    content {

                      dynamic "static_key_settings" {
                        for_each = key_provider_settings.value.static_key_settings != null ? key_provider_settings.value.static_key_settings : []
                        content {
                          static_key_value = static_key_settings.value.static_key_value

                          dynamic "key_provider_server" {
                            for_each = static_key_settings.value.key_provider_server != null ? static_key_settings.value.key_provider_server : []
                            content {
                              uri            = key_provider_server.value.uri
                              password_param = key_provider_server.value.password_param
                              username       = key_provider_server.value.username
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }

              dynamic "media_package_group_settings" {
                for_each = output_group_settings.value.media_package_group_settings != null ? output_group_settings.value.media_package_group_settings : []
                content {

                  dynamic "destination" {
                    for_each = media_package_group_settings.value.destination != null ? media_package_group_settings.value.destination : []
                    content {
                      destination_ref_id = destination.value.destination_ref_id
                    }
                  }
                }
              }

              dynamic "ms_smooth_group_settings" {
                for_each = output_group_settings.value.ms_smooth_group_settings != null ? output_group_settings.value.ms_smooth_group_settings : []
                content {
                  acquisition_point_id        = ms_smooth_group_settings.value.acquisition_point_id
                  audio_only_timecode_control = ms_smooth_group_settings.value.audio_only_timecode_control
                  certificate_mode            = ms_smooth_group_settings.value.certificate_mode
                  connection_retry_interval   = ms_smooth_group_settings.value.connection_retry_interval
                  event_id                    = ms_smooth_group_settings.value.event_id
                  event_id_mode               = ms_smooth_group_settings.value.event_id_mode
                  event_stop_behavior         = ms_smooth_group_settings.value.event_stop_behavior
                  filecache_duration          = ms_smooth_group_settings.value.filecache_duration
                  fragment_length             = ms_smooth_group_settings.value.fragment_length
                  input_loss_action           = ms_smooth_group_settings.value.input_loss_action
                  num_retries                 = ms_smooth_group_settings.value.num_retries
                  restart_delay               = ms_smooth_group_settings.value.restart_delay
                  segmentation_mode           = ms_smooth_group_settings.value.segmentation_mode
                  send_delay_ms               = ms_smooth_group_settings.value.send_delay_ms
                  sparse_track_type           = ms_smooth_group_settings.value.sparse_track_type
                  stream_manifest_behavior    = ms_smooth_group_settings.value.stream_manifest_behavior
                  timestamp_offset            = ms_smooth_group_settings.value.timestamp_offset
                  timestamp_offset_mode       = ms_smooth_group_settings.value.timestamp_offset_mode

                  dynamic "destination" {
                    for_each = ms_smooth_group_settings.value.destination != null ? ms_smooth_group_settings.value.destination : []
                    content {
                      destination_ref_id = destination.value.destination_ref_id
                    }
                  }
                }
              }

              dynamic "multiplex_group_settings" {
                for_each = output_group_settings.value.multiplex_group_settings != null ? output_group_settings.value.multiplex_group_settings : []
                content {
                }
              }

              dynamic "rtmp_group_settings" {
                for_each = output_group_settings.value.rtmp_group_settings != null ? output_group_settings.value.rtmp_group_settings : []
                content {
                  ad_markers            = rtmp_group_settings.value.ad_markers
                  authentication_scheme = rtmp_group_settings.value.authentication_scheme
                  cache_full_behavior   = rtmp_group_settings.value.cache_full_behavior
                  cache_length          = rtmp_group_settings.value.cache_length
                  caption_data          = rtmp_group_settings.value.caption_data
                  input_loss_action     = rtmp_group_settings.value.input_loss_action
                  restart_delay         = rtmp_group_settings.value.restart_delay
                }
              }

              dynamic "udp_group_settings" {
                for_each = output_group_settings.value.udp_group_settings != null ? output_group_settings.value.udp_group_settings : []
                content {
                  input_loss_action         = udp_group_settings.value.input_loss_action
                  timed_metadata_id3_frame  = udp_group_settings.value.timed_metadata_id3_frame
                  timed_metadata_id3_period = udp_group_settings.value.timed_metadata_id3_period
                }
              }
            }
          }

          dynamic "outputs" {
            for_each = output_groups.value.outputs != null ? output_groups.value.outputs : []
            content {
              audio_description_names   = outputs.value.audio_description_names
              caption_description_names = outputs.value.caption_description_names
              output_name               = outputs.value.output_name
              video_description_name    = outputs.value.video_description_name

              dynamic "output_settings" {
                for_each = outputs.value.output_settings != null ? outputs.value.output_settings : []
                content {

                  dynamic "archive_output_settings" {
                    for_each = output_settings.value.archive_output_settings != null ? output_settings.value.archive_output_settings : []
                    content {
                      extension     = archive_output_settings.value.extension
                      name_modifier = archive_output_settings.value.name_modifier

                      dynamic "container_settings" {
                        for_each = archive_output_settings.value.container_settings != null ? archive_output_settings.value.container_settings : []
                        content {

                          dynamic "m2ts_settings" {
                            for_each = container_settings.value.m2ts_settings != null ? container_settings.value.m2ts_settings : []
                            content {
                              absent_input_audio_behavior = m2ts_settings.value.absent_input_audio_behavior
                              arib                        = m2ts_settings.value.arib
                              arib_captions_pid           = m2ts_settings.value.arib_captions_pid
                              arib_captions_pid_control   = m2ts_settings.value.arib_captions_pid_control
                              audio_buffer_model          = m2ts_settings.value.audio_buffer_model
                              audio_frames_per_pes        = m2ts_settings.value.audio_frames_per_pes
                              audio_pids                  = m2ts_settings.value.audio_pids
                              audio_stream_type           = m2ts_settings.value.audio_stream_type
                              bitrate                     = m2ts_settings.value.bitrate
                              buffer_model                = m2ts_settings.value.buffer_model
                              cc_descriptor               = m2ts_settings.value.cc_descriptor
                              dvb_sub_pids                = m2ts_settings.value.dvb_sub_pids
                              dvb_teletext_pid            = m2ts_settings.value.dvb_teletext_pid
                              ebif                        = m2ts_settings.value.ebif
                              ebp_audio_interval          = m2ts_settings.value.ebp_audio_interval
                              ebp_lookahead_ms            = m2ts_settings.value.ebp_lookahead_ms
                              ebp_placement               = m2ts_settings.value.ebp_placement
                              ecm_pid                     = m2ts_settings.value.ecm_pid
                              es_rate_in_pes              = m2ts_settings.value.es_rate_in_pes
                              etv_platform_pid            = m2ts_settings.value.etv_platform_pid
                              etv_signal_pid              = m2ts_settings.value.etv_signal_pid
                              fragment_time               = m2ts_settings.value.fragment_time
                              klv                         = m2ts_settings.value.klv
                              klv_data_pids               = m2ts_settings.value.klv_data_pids
                              nielsen_id3_behavior        = m2ts_settings.value.nielsen_id3_behavior
                              null_packet_bitrate         = m2ts_settings.value.null_packet_bitrate
                              pat_interval                = m2ts_settings.value.pat_interval
                              pcr_control                 = m2ts_settings.value.pcr_control
                              pcr_period                  = m2ts_settings.value.pcr_period
                              pcr_pid                     = m2ts_settings.value.pcr_pid
                              pmt_interval                = m2ts_settings.value.pmt_interval
                              pmt_pid                     = m2ts_settings.value.pmt_pid
                              program_num                 = m2ts_settings.value.program_num
                              rate_mode                   = m2ts_settings.value.rate_mode
                              scte27_pids                 = m2ts_settings.value.scte27_pids
                              scte35_control              = m2ts_settings.value.scte35_control
                              scte35_pid                  = m2ts_settings.value.scte35_pid
                              segmentation_markers        = m2ts_settings.value.segmentation_markers
                              segmentation_style          = m2ts_settings.value.segmentation_style
                              segmentation_time           = m2ts_settings.value.segmentation_time
                              timed_metadata_behavior     = m2ts_settings.value.timed_metadata_behavior
                              timed_metadata_pid          = m2ts_settings.value.timed_metadata_pid
                              transport_stream_id         = m2ts_settings.value.transport_stream_id
                              video_pid                   = m2ts_settings.value.video_pid

                              dynamic "dvb_nit_settings" {
                                for_each = m2ts_settings.value.dvb_nit_settings != null ? m2ts_settings.value.dvb_nit_settings : []
                                content {
                                  network_id   = dvb_nit_settings.value.network_id
                                  network_name = dvb_nit_settings.value.network_name
                                  rep_interval = dvb_nit_settings.value.rep_interval
                                }
                              }

                              dynamic "dvb_sdt_settings" {
                                for_each = m2ts_settings.value.dvb_sdt_settings != null ? m2ts_settings.value.dvb_sdt_settings : []
                                content {
                                  output_sdt            = dvb_sdt_settings.value.output_sdt
                                  rep_interval          = dvb_sdt_settings.value.rep_interval
                                  service_name          = dvb_sdt_settings.value.service_name
                                  service_provider_name = dvb_sdt_settings.value.service_provider_name
                                }
                              }

                              dynamic "dvb_tdt_settings" {
                                for_each = m2ts_settings.value.dvb_tdt_settings != null ? m2ts_settings.value.dvb_tdt_settings : []
                                content {
                                  rep_interval = dvb_tdt_settings.value.rep_interval
                                }
                              }
                            }
                          }

                          dynamic "raw_settings" {
                            for_each = container_settings.value.raw_settings != null ? container_settings.value.raw_settings : []
                            content {
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "frame_capture_output_settings" {
                    for_each = output_settings.value.frame_capture_output_settings != null ? output_settings.value.frame_capture_output_settings : []
                    content {
                      name_modifier = frame_capture_output_settings.value.name_modifier
                    }
                  }

                  dynamic "hls_output_settings" {
                    for_each = output_settings.value.hls_output_settings != null ? output_settings.value.hls_output_settings : []
                    content {
                      h265_packaging_type = hls_output_settings.value.h265_packaging_type
                      name_modifier       = hls_output_settings.value.name_modifier
                      segment_modifier    = hls_output_settings.value.segment_modifier

                      dynamic "hls_settings" {
                        for_each = hls_output_settings.value.hls_settings != null ? hls_output_settings.value.hls_settings : []
                        content {

                          dynamic "audio_only_hls_settings" {
                            for_each = hls_settings.value.audio_only_hls_settings != null ? hls_settings.value.audio_only_hls_settings : []
                            content {
                              audio_group_id   = audio_only_hls_settings.value.audio_group_id
                              audio_track_type = audio_only_hls_settings.value.audio_track_type
                              segment_type     = audio_only_hls_settings.value.segment_type

                              dynamic "audio_only_image" {
                                for_each = audio_only_hls_settings.value.audio_only_image != null ? audio_only_hls_settings.value.audio_only_image : []
                                content {
                                  uri            = audio_only_image.value.uri
                                  password_param = audio_only_image.value.password_param
                                  username       = audio_only_image.value.username
                                }
                              }
                            }
                          }

                          dynamic "fmp4_hls_settings" {
                            for_each = hls_settings.value.fmp4_hls_settings != null ? hls_settings.value.fmp4_hls_settings : []
                            content {
                              audio_rendition_sets    = fmp4_hls_settings.value.audio_rendition_sets
                              nielsen_id3_behavior    = fmp4_hls_settings.value.nielsen_id3_behavior
                              timed_metadata_behavior = fmp4_hls_settings.value.timed_metadata_behavior
                            }
                          }

                          dynamic "frame_capture_hls_settings" {
                            for_each = hls_settings.value.frame_capture_hls_settings != null ? hls_settings.value.frame_capture_hls_settings : []
                            content {
                            }
                          }

                          dynamic "standard_hls_settings" {
                            for_each = hls_settings.value.standard_hls_settings != null ? hls_settings.value.standard_hls_settings : []
                            content {
                              audio_rendition_sets = standard_hls_settings.value.audio_rendition_sets

                              dynamic "m3u8_settings" {
                                for_each = standard_hls_settings.value.m3u8_settings != null ? standard_hls_settings.value.m3u8_settings : []
                                content {
                                  audio_frames_per_pes    = m3u8_settings.value.audio_frames_per_pes
                                  audio_pids              = m3u8_settings.value.audio_pids
                                  ecm_pid                 = m3u8_settings.value.ecm_pid
                                  nielsen_id3_behavior    = m3u8_settings.value.nielsen_id3_behavior
                                  pat_interval            = m3u8_settings.value.pat_interval
                                  pcr_control             = m3u8_settings.value.pcr_control
                                  pcr_period              = m3u8_settings.value.pcr_period
                                  pcr_pid                 = m3u8_settings.value.pcr_pid
                                  pmt_interval            = m3u8_settings.value.pmt_interval
                                  pmt_pid                 = m3u8_settings.value.pmt_pid
                                  program_num             = m3u8_settings.value.program_num
                                  scte35_behavior         = m3u8_settings.value.scte35_behavior
                                  scte35_pid              = m3u8_settings.value.scte35_pid
                                  timed_metadata_behavior = m3u8_settings.value.timed_metadata_behavior
                                  timed_metadata_pid      = m3u8_settings.value.timed_metadata_pid
                                  transport_stream_id     = m3u8_settings.value.transport_stream_id
                                  video_pid               = m3u8_settings.value.video_pid
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }

                  dynamic "media_package_output_settings" {
                    for_each = output_settings.value.media_package_output_settings != null ? output_settings.value.media_package_output_settings : []
                    content {
                    }
                  }

                  dynamic "ms_smooth_output_settings" {
                    for_each = output_settings.value.ms_smooth_output_settings != null ? output_settings.value.ms_smooth_output_settings : []
                    content {
                      h265_packaging_type = ms_smooth_output_settings.value.h265_packaging_type
                      name_modifier       = ms_smooth_output_settings.value.name_modifier
                    }
                  }

                  dynamic "multiplex_output_settings" {
                    for_each = output_settings.value.multiplex_output_settings != null ? output_settings.value.multiplex_output_settings : []
                    content {

                      dynamic "destination" {
                        for_each = multiplex_output_settings.value.destination != null ? multiplex_output_settings.value.destination : []
                        content {
                          destination_ref_id = destination.value.destination_ref_id
                        }
                      }
                    }
                  }

                  dynamic "rtmp_output_settings" {
                    for_each = output_settings.value.rtmp_output_settings != null ? output_settings.value.rtmp_output_settings : []
                    content {
                      certificate_mode          = rtmp_output_settings.value.certificate_mode
                      connection_retry_interval = rtmp_output_settings.value.connection_retry_interval
                      num_retries               = rtmp_output_settings.value.num_retries

                      dynamic "destination" {
                        for_each = rtmp_output_settings.value.destination != null ? rtmp_output_settings.value.destination : []
                        content {
                          destination_ref_id = destination.value.destination_ref_id
                        }
                      }
                    }
                  }

                  dynamic "udp_output_settings" {
                    for_each = output_settings.value.udp_output_settings != null ? output_settings.value.udp_output_settings : []
                    content {
                      buffer_msec = udp_output_settings.value.buffer_msec

                      dynamic "container_settings" {
                        for_each = udp_output_settings.value.container_settings != null ? udp_output_settings.value.container_settings : []
                        content {

                          dynamic "m2ts_settings" {
                            for_each = container_settings.value.m2ts_settings != null ? container_settings.value.m2ts_settings : []
                            content {
                              absent_input_audio_behavior = m2ts_settings.value.absent_input_audio_behavior
                              arib                        = m2ts_settings.value.arib
                              arib_captions_pid           = m2ts_settings.value.arib_captions_pid
                              arib_captions_pid_control   = m2ts_settings.value.arib_captions_pid_control
                              audio_buffer_model          = m2ts_settings.value.audio_buffer_model
                              audio_frames_per_pes        = m2ts_settings.value.audio_frames_per_pes
                              audio_pids                  = m2ts_settings.value.audio_pids
                              audio_stream_type           = m2ts_settings.value.audio_stream_type
                              bitrate                     = m2ts_settings.value.bitrate
                              buffer_model                = m2ts_settings.value.buffer_model
                              cc_descriptor               = m2ts_settings.value.cc_descriptor
                              dvb_sub_pids                = m2ts_settings.value.dvb_sub_pids
                              dvb_teletext_pid            = m2ts_settings.value.dvb_teletext_pid
                              ebif                        = m2ts_settings.value.ebif
                              ebp_audio_interval          = m2ts_settings.value.ebp_audio_interval
                              ebp_lookahead_ms            = m2ts_settings.value.ebp_lookahead_ms
                              ebp_placement               = m2ts_settings.value.ebp_placement
                              ecm_pid                     = m2ts_settings.value.ecm_pid
                              es_rate_in_pes              = m2ts_settings.value.es_rate_in_pes
                              etv_platform_pid            = m2ts_settings.value.etv_platform_pid
                              etv_signal_pid              = m2ts_settings.value.etv_signal_pid
                              fragment_time               = m2ts_settings.value.fragment_time
                              klv                         = m2ts_settings.value.klv
                              klv_data_pids               = m2ts_settings.value.klv_data_pids
                              nielsen_id3_behavior        = m2ts_settings.value.nielsen_id3_behavior
                              null_packet_bitrate         = m2ts_settings.value.null_packet_bitrate
                              pat_interval                = m2ts_settings.value.pat_interval
                              pcr_control                 = m2ts_settings.value.pcr_control
                              pcr_period                  = m2ts_settings.value.pcr_period
                              pcr_pid                     = m2ts_settings.value.pcr_pid
                              pmt_interval                = m2ts_settings.value.pmt_interval
                              pmt_pid                     = m2ts_settings.value.pmt_pid
                              program_num                 = m2ts_settings.value.program_num
                              rate_mode                   = m2ts_settings.value.rate_mode
                              scte27_pids                 = m2ts_settings.value.scte27_pids
                              scte35_control              = m2ts_settings.value.scte35_control
                              scte35_pid                  = m2ts_settings.value.scte35_pid
                              segmentation_markers        = m2ts_settings.value.segmentation_markers
                              segmentation_style          = m2ts_settings.value.segmentation_style
                              segmentation_time           = m2ts_settings.value.segmentation_time
                              timed_metadata_behavior     = m2ts_settings.value.timed_metadata_behavior
                              timed_metadata_pid          = m2ts_settings.value.timed_metadata_pid
                              transport_stream_id         = m2ts_settings.value.transport_stream_id
                              video_pid                   = m2ts_settings.value.video_pid

                              dynamic "dvb_nit_settings" {
                                for_each = m2ts_settings.value.dvb_nit_settings != null ? m2ts_settings.value.dvb_nit_settings : []
                                content {
                                  network_id   = dvb_nit_settings.value.network_id
                                  network_name = dvb_nit_settings.value.network_name
                                  rep_interval = dvb_nit_settings.value.rep_interval
                                }
                              }

                              dynamic "dvb_sdt_settings" {
                                for_each = m2ts_settings.value.dvb_sdt_settings != null ? m2ts_settings.value.dvb_sdt_settings : []
                                content {
                                  output_sdt            = dvb_sdt_settings.value.output_sdt
                                  rep_interval          = dvb_sdt_settings.value.rep_interval
                                  service_name          = dvb_sdt_settings.value.service_name
                                  service_provider_name = dvb_sdt_settings.value.service_provider_name
                                }
                              }

                              dynamic "dvb_tdt_settings" {
                                for_each = m2ts_settings.value.dvb_tdt_settings != null ? m2ts_settings.value.dvb_tdt_settings : []
                                content {
                                  rep_interval = dvb_tdt_settings.value.rep_interval
                                }
                              }
                            }
                          }
                        }
                      }

                      dynamic "destination" {
                        for_each = udp_output_settings.value.destination != null ? udp_output_settings.value.destination : []
                        content {
                          destination_ref_id = destination.value.destination_ref_id
                        }
                      }

                      dynamic "fec_output_settings" {
                        for_each = udp_output_settings.value.fec_output_settings != null ? udp_output_settings.value.fec_output_settings : []
                        content {
                          column_depth = fec_output_settings.value.column_depth
                          include_fec  = fec_output_settings.value.include_fec
                          row_length   = fec_output_settings.value.row_length
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "timecode_config" {
        for_each = encoder_settings.value.timecode_config != null ? encoder_settings.value.timecode_config : []
        content {
          source         = timecode_config.value.source
          sync_threshold = timecode_config.value.sync_threshold
        }
      }

      dynamic "video_descriptions" {
        for_each = encoder_settings.value.video_descriptions != null ? encoder_settings.value.video_descriptions : []
        content {
          name             = video_descriptions.value.name
          height           = video_descriptions.value.height
          respond_to_afd   = video_descriptions.value.respond_to_afd
          scaling_behavior = video_descriptions.value.scaling_behavior
          sharpness        = video_descriptions.value.sharpness
          width            = video_descriptions.value.width

          dynamic "codec_settings" {
            for_each = video_descriptions.value.codec_settings != null ? video_descriptions.value.codec_settings : []
            content {

              dynamic "frame_capture_settings" {
                for_each = codec_settings.value.frame_capture_settings != null ? codec_settings.value.frame_capture_settings : []
                content {
                  capture_interval       = frame_capture_settings.value.capture_interval
                  capture_interval_units = frame_capture_settings.value.capture_interval_units
                }
              }

              dynamic "h264_settings" {
                for_each = codec_settings.value.h264_settings != null ? codec_settings.value.h264_settings : []
                content {
                  adaptive_quantization   = h264_settings.value.adaptive_quantization
                  afd_signaling           = h264_settings.value.afd_signaling
                  bitrate                 = h264_settings.value.bitrate
                  buf_fill_pct            = h264_settings.value.buf_fill_pct
                  buf_size                = h264_settings.value.buf_size
                  color_metadata          = h264_settings.value.color_metadata
                  entropy_encoding        = h264_settings.value.entropy_encoding
                  fixed_afd               = h264_settings.value.fixed_afd
                  flicker_aq              = h264_settings.value.flicker_aq
                  force_field_pictures    = h264_settings.value.force_field_pictures
                  framerate_control       = h264_settings.value.framerate_control
                  framerate_denominator   = h264_settings.value.framerate_denominator
                  framerate_numerator     = h264_settings.value.framerate_numerator
                  gop_b_reference         = h264_settings.value.gop_b_reference
                  gop_closed_cadence      = h264_settings.value.gop_closed_cadence
                  gop_num_b_frames        = h264_settings.value.gop_num_b_frames
                  gop_size                = h264_settings.value.gop_size
                  gop_size_units          = h264_settings.value.gop_size_units
                  level                   = h264_settings.value.level
                  look_ahead_rate_control = h264_settings.value.look_ahead_rate_control
                  max_bitrate             = h264_settings.value.max_bitrate
                  min_i_interval          = h264_settings.value.min_i_interval
                  num_ref_frames          = h264_settings.value.num_ref_frames
                  par_control             = h264_settings.value.par_control
                  par_denominator         = h264_settings.value.par_denominator
                  par_numerator           = h264_settings.value.par_numerator
                  profile                 = h264_settings.value.profile
                  quality_level           = h264_settings.value.quality_level
                  qvbr_quality_level      = h264_settings.value.qvbr_quality_level
                  rate_control_mode       = h264_settings.value.rate_control_mode
                  scan_type               = h264_settings.value.scan_type
                  scene_change_detect     = h264_settings.value.scene_change_detect
                  slices                  = h264_settings.value.slices
                  softness                = h264_settings.value.softness
                  spatial_aq              = h264_settings.value.spatial_aq
                  subgop_length           = h264_settings.value.subgop_length
                  syntax                  = h264_settings.value.syntax
                  temporal_aq             = h264_settings.value.temporal_aq
                  timecode_insertion      = h264_settings.value.timecode_insertion

                  dynamic "filter_settings" {
                    for_each = h264_settings.value.filter_settings != null ? h264_settings.value.filter_settings : []
                    content {

                      dynamic "temporal_filter_settings" {
                        for_each = filter_settings.value.temporal_filter_settings != null ? filter_settings.value.temporal_filter_settings : []
                        content {
                          post_filter_sharpening = temporal_filter_settings.value.post_filter_sharpening
                          strength               = temporal_filter_settings.value.strength
                        }
                      }
                    }
                  }
                }
              }

              dynamic "h265_settings" {
                for_each = codec_settings.value.h265_settings != null ? codec_settings.value.h265_settings : []
                content {
                  bitrate                       = h265_settings.value.bitrate
                  framerate_denominator         = h265_settings.value.framerate_denominator
                  framerate_numerator           = h265_settings.value.framerate_numerator
                  adaptive_quantization         = h265_settings.value.adaptive_quantization
                  afd_signaling                 = h265_settings.value.afd_signaling
                  alternative_transfer_function = h265_settings.value.alternative_transfer_function
                  buf_size                      = h265_settings.value.buf_size
                  color_metadata                = h265_settings.value.color_metadata
                  fixed_afd                     = h265_settings.value.fixed_afd
                  flicker_aq                    = h265_settings.value.flicker_aq
                  gop_closed_cadence            = h265_settings.value.gop_closed_cadence
                  gop_size                      = h265_settings.value.gop_size
                  gop_size_units                = h265_settings.value.gop_size_units
                  level                         = h265_settings.value.level
                  look_ahead_rate_control       = h265_settings.value.look_ahead_rate_control
                  max_bitrate                   = h265_settings.value.max_bitrate
                  min_i_interval                = h265_settings.value.min_i_interval
                  min_qp                        = h265_settings.value.min_qp
                  mv_over_picture_boundaries    = h265_settings.value.mv_over_picture_boundaries
                  mv_temporal_predictor         = h265_settings.value.mv_temporal_predictor
                  par_denominator               = h265_settings.value.par_denominator
                  par_numerator                 = h265_settings.value.par_numerator
                  profile                       = h265_settings.value.profile
                  qvbr_quality_level            = h265_settings.value.qvbr_quality_level
                  rate_control_mode             = h265_settings.value.rate_control_mode
                  scan_type                     = h265_settings.value.scan_type
                  scene_change_detect           = h265_settings.value.scene_change_detect
                  slices                        = h265_settings.value.slices
                  tier                          = h265_settings.value.tier
                  tile_height                   = h265_settings.value.tile_height
                  tile_padding                  = h265_settings.value.tile_padding
                  tile_width                    = h265_settings.value.tile_width
                  timecode_insertion            = h265_settings.value.timecode_insertion
                  treeblock_size                = h265_settings.value.treeblock_size

                  dynamic "color_space_settings" {
                    for_each = h265_settings.value.color_space_settings != null ? h265_settings.value.color_space_settings : []
                    content {

                      dynamic "color_space_passthrough_settings" {
                        for_each = color_space_settings.value.color_space_passthrough_settings != null ? color_space_settings.value.color_space_passthrough_settings : []
                        content {
                        }
                      }

                      dynamic "dolby_vision81_settings" {
                        for_each = color_space_settings.value.dolby_vision81_settings != null ? color_space_settings.value.dolby_vision81_settings : []
                        content {
                        }
                      }

                      dynamic "hdr10_settings" {
                        for_each = color_space_settings.value.hdr10_settings != null ? color_space_settings.value.hdr10_settings : []
                        content {
                          max_cll  = hdr10_settings.value.max_cll
                          max_fall = hdr10_settings.value.max_fall
                        }
                      }

                      dynamic "rec601_settings" {
                        for_each = color_space_settings.value.rec601_settings != null ? color_space_settings.value.rec601_settings : []
                        content {
                        }
                      }

                      dynamic "rec709_settings" {
                        for_each = color_space_settings.value.rec709_settings != null ? color_space_settings.value.rec709_settings : []
                        content {
                        }
                      }
                    }
                  }

                  dynamic "filter_settings" {
                    for_each = h265_settings.value.filter_settings != null ? h265_settings.value.filter_settings : []
                    content {

                      dynamic "temporal_filter_settings" {
                        for_each = filter_settings.value.temporal_filter_settings != null ? filter_settings.value.temporal_filter_settings : []
                        content {
                          post_filter_sharpening = temporal_filter_settings.value.post_filter_sharpening
                          strength               = temporal_filter_settings.value.strength
                        }
                      }
                    }
                  }

                  dynamic "timecode_burnin_settings" {
                    for_each = h265_settings.value.timecode_burnin_settings != null ? h265_settings.value.timecode_burnin_settings : []
                    content {
                      prefix                    = timecode_burnin_settings.value.prefix
                      timecode_burnin_font_size = timecode_burnin_settings.value.timecode_burnin_font_size
                      timecode_burnin_position  = timecode_burnin_settings.value.timecode_burnin_position
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "input_attachments" {
    for_each = each.value.input_attachments != null ? each.value.input_attachments : []
    content {
      input_attachment_name = input_attachments.value.input_attachment_name
      input_id              = input_attachments.value.input_id

      dynamic "automatic_input_failover_settings" {
        for_each = input_attachments.value.automatic_input_failover_settings != null ? input_attachments.value.automatic_input_failover_settings : []
        content {
          secondary_input_id    = automatic_input_failover_settings.value.secondary_input_id
          error_clear_time_msec = automatic_input_failover_settings.value.error_clear_time_msec
          input_preference      = automatic_input_failover_settings.value.input_preference

          dynamic "failover_condition" {
            for_each = automatic_input_failover_settings.value.failover_condition != null ? automatic_input_failover_settings.value.failover_condition : []
            content {

              dynamic "failover_condition_settings" {
                for_each = failover_condition.value.failover_condition_settings != null ? failover_condition.value.failover_condition_settings : []
                content {

                  dynamic "audio_silence_settings" {
                    for_each = failover_condition_settings.value.audio_silence_settings != null ? failover_condition_settings.value.audio_silence_settings : []
                    content {
                      audio_selector_name          = audio_silence_settings.value.audio_selector_name
                      audio_silence_threshold_msec = audio_silence_settings.value.audio_silence_threshold_msec
                    }
                  }

                  dynamic "input_loss_settings" {
                    for_each = failover_condition_settings.value.input_loss_settings != null ? failover_condition_settings.value.input_loss_settings : []
                    content {
                      input_loss_threshold_msec = input_loss_settings.value.input_loss_threshold_msec
                    }
                  }

                  dynamic "video_black_settings" {
                    for_each = failover_condition_settings.value.video_black_settings != null ? failover_condition_settings.value.video_black_settings : []
                    content {
                      black_detect_threshold     = video_black_settings.value.black_detect_threshold
                      video_black_threshold_msec = video_black_settings.value.video_black_threshold_msec
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "input_settings" {
        for_each = input_attachments.value.input_settings != null ? input_attachments.value.input_settings : []
        content {
          deblock_filter            = input_settings.value.deblock_filter
          denoise_filter            = input_settings.value.denoise_filter
          filter_strength           = input_settings.value.filter_strength
          input_filter              = input_settings.value.input_filter
          scte35_pid                = input_settings.value.scte35_pid
          smpte2038_data_preference = input_settings.value.smpte2038_data_preference
          source_end_behavior       = input_settings.value.source_end_behavior

          dynamic "audio_selector" {
            for_each = input_settings.value.audio_selector != null ? input_settings.value.audio_selector : []
            content {
              name = audio_selector.value.name

              dynamic "selector_settings" {
                for_each = audio_selector.value.selector_settings != null ? audio_selector.value.selector_settings : []
                content {

                  dynamic "audio_hls_rendition_selection" {
                    for_each = selector_settings.value.audio_hls_rendition_selection != null ? selector_settings.value.audio_hls_rendition_selection : []
                    content {
                      group_id = audio_hls_rendition_selection.value.group_id
                      name     = audio_hls_rendition_selection.value.name
                    }
                  }

                  dynamic "audio_language_selection" {
                    for_each = selector_settings.value.audio_language_selection != null ? selector_settings.value.audio_language_selection : []
                    content {
                      language_code             = audio_language_selection.value.language_code
                      language_selection_policy = audio_language_selection.value.language_selection_policy
                    }
                  }

                  dynamic "audio_pid_selection" {
                    for_each = selector_settings.value.audio_pid_selection != null ? selector_settings.value.audio_pid_selection : []
                    content {
                      pid = audio_pid_selection.value.pid
                    }
                  }

                  dynamic "audio_track_selection" {
                    for_each = selector_settings.value.audio_track_selection != null ? selector_settings.value.audio_track_selection : []
                    content {

                      dynamic "dolby_e_decode" {
                        for_each = audio_track_selection.value.dolby_e_decode != null ? audio_track_selection.value.dolby_e_decode : []
                        content {
                          program_selection = dolby_e_decode.value.program_selection
                        }
                      }

                      dynamic "tracks" {
                        for_each = audio_track_selection.value.tracks != null ? audio_track_selection.value.tracks : []
                        content {
                          track = tracks.value.track
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "caption_selector" {
            for_each = input_settings.value.caption_selector != null ? input_settings.value.caption_selector : []
            content {
              name          = caption_selector.value.name
              language_code = caption_selector.value.language_code

              dynamic "selector_settings" {
                for_each = caption_selector.value.selector_settings != null ? caption_selector.value.selector_settings : []
                content {

                  dynamic "ancillary_source_settings" {
                    for_each = selector_settings.value.ancillary_source_settings != null ? selector_settings.value.ancillary_source_settings : []
                    content {
                      source_ancillary_channel_number = ancillary_source_settings.value.source_ancillary_channel_number
                    }
                  }

                  dynamic "arib_source_settings" {
                    for_each = selector_settings.value.arib_source_settings != null ? selector_settings.value.arib_source_settings : []
                    content {
                    }
                  }

                  dynamic "dvb_sub_source_settings" {
                    for_each = selector_settings.value.dvb_sub_source_settings != null ? selector_settings.value.dvb_sub_source_settings : []
                    content {
                      ocr_language = dvb_sub_source_settings.value.ocr_language
                      pid          = dvb_sub_source_settings.value.pid
                    }
                  }

                  dynamic "embedded_source_settings" {
                    for_each = selector_settings.value.embedded_source_settings != null ? selector_settings.value.embedded_source_settings : []
                    content {
                      convert_608_to_708        = embedded_source_settings.value.convert_608_to_708
                      scte20_detection          = embedded_source_settings.value.scte20_detection
                      source_608_channel_number = embedded_source_settings.value.source_608_channel_number
                    }
                  }

                  dynamic "scte20_source_settings" {
                    for_each = selector_settings.value.scte20_source_settings != null ? selector_settings.value.scte20_source_settings : []
                    content {
                      convert_608_to_708        = scte20_source_settings.value.convert_608_to_708
                      source_608_channel_number = scte20_source_settings.value.source_608_channel_number
                    }
                  }

                  dynamic "scte27_source_settings" {
                    for_each = selector_settings.value.scte27_source_settings != null ? selector_settings.value.scte27_source_settings : []
                    content {
                      ocr_language = scte27_source_settings.value.ocr_language
                      pid          = scte27_source_settings.value.pid
                    }
                  }

                  dynamic "teletext_source_settings" {
                    for_each = selector_settings.value.teletext_source_settings != null ? selector_settings.value.teletext_source_settings : []
                    content {
                      page_number = teletext_source_settings.value.page_number

                      dynamic "output_rectangle" {
                        for_each = teletext_source_settings.value.output_rectangle != null ? teletext_source_settings.value.output_rectangle : []
                        content {
                          height      = output_rectangle.value.height
                          left_offset = output_rectangle.value.left_offset
                          top_offset  = output_rectangle.value.top_offset
                          width       = output_rectangle.value.width
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "network_input_settings" {
            for_each = input_settings.value.network_input_settings != null ? input_settings.value.network_input_settings : []
            content {
              server_validation = network_input_settings.value.server_validation

              dynamic "hls_input_settings" {
                for_each = network_input_settings.value.hls_input_settings != null ? network_input_settings.value.hls_input_settings : []
                content {
                  bandwidth       = hls_input_settings.value.bandwidth
                  buffer_segments = hls_input_settings.value.buffer_segments
                  retries         = hls_input_settings.value.retries
                  retry_interval  = hls_input_settings.value.retry_interval
                  scte35_source   = hls_input_settings.value.scte35_source
                }
              }
            }
          }

          dynamic "video_selector" {
            for_each = input_settings.value.video_selector != null ? input_settings.value.video_selector : []
            content {
              color_space       = video_selector.value.color_space
              color_space_usage = video_selector.value.color_space_usage
            }
          }
        }
      }
    }
  }

  dynamic "input_specification" {
    for_each = each.value.input_specification != null ? each.value.input_specification : []
    content {
      codec            = input_specification.value.codec
      input_resolution = input_specification.value.input_resolution
      maximum_bitrate  = input_specification.value.maximum_bitrate
    }
  }

  dynamic "maintenance" {
    for_each = each.value.maintenance != null ? each.value.maintenance : []
    content {
      maintenance_day        = maintenance.value.maintenance_day
      maintenance_start_time = maintenance.value.maintenance_start_time
    }
  }

  dynamic "vpc" {
    for_each = each.value.vpc != null ? each.value.vpc : []
    content {
      public_address_allocation_ids = vpc.value.public_address_allocation_ids
      subnet_ids                    = vpc.value.subnet_ids
      security_group_ids            = vpc.value.security_group_ids
    }
  }
}
