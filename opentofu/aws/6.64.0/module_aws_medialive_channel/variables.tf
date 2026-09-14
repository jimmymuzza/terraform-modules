variable "medialive_channels" {
  description = <<EOT
Map of medialive_channels, attributes below
Required:
    - channel_class
    - name
    - destinations
    - encoder_settings
    - input_attachments
    - input_specification
Optional:
    - log_level
    - region
    - role_arn
    - start_channel
    - tags
    - tags_all
    - cdi_input_specification
    - maintenance
    - vpc
EOT

  type = map(object({
    channel_class           = string
    name                    = string
    log_level               = optional(string)
    region                  = optional(string)
    role_arn                = optional(string)
    start_channel           = optional(bool)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    cdi_input_specification = optional(list(object({
            resolution = string
        })))
    destinations            = set(object({
            media_package_settings = optional(set(object({
                channel_id = string
            })))
            multiplex_settings     = optional(list(object({
                multiplex_id = string
                program_name = string
            })))
            settings               = optional(set(object({
                password_param = optional(string)
                stream_name    = optional(string)
                url            = optional(string)
                username       = optional(string)
            })))
        }))
    encoder_settings        = list(object({
            audio_descriptions            = optional(set(object({
                audio_selector_name          = string
                name                         = string
                audio_type                   = optional(string)
                audio_type_control           = optional(string)
                language_code                = optional(string)
                language_code_control        = optional(string)
                stream_name                  = optional(string)
                audio_normalization_settings = optional(list(object({
                    algorithm         = optional(string)
                    algorithm_control = optional(string)
                    target_lkfs       = optional(number)
                })))
                audio_watermark_settings     = optional(list(object({
                    nielsen_watermarks_settings = optional(list(object({
                        nielsen_distribution_type   = optional(string)
                        nielsen_cbet_settings       = optional(list(object({
                            cbet_check_digit_string = string
                            cbet_stepaside          = string
                            csid                    = string
                        })))
                        nielsen_naes_ii_nw_settings = optional(list(object({
                            check_digit_string = string
                            sid                = number
                        })))
                    })))
                })))
                codec_settings               = optional(list(object({
                    aac_settings          = optional(list(object({
                        bitrate           = optional(number)
                        coding_mode       = optional(string)
                        input_type        = optional(string)
                        profile           = optional(string)
                        rate_control_mode = optional(string)
                        raw_format        = optional(string)
                        sample_rate       = optional(number)
                        spec              = optional(string)
                        vbr_quality       = optional(string)
                    })))
                    ac3_settings          = optional(list(object({
                        bitrate          = optional(number)
                        bitstream_mode   = optional(string)
                        coding_mode      = optional(string)
                        dialnorm         = optional(number)
                        drc_profile      = optional(string)
                        lfe_filter       = optional(string)
                        metadata_control = optional(string)
                    })))
                    eac3_atmos_settings   = optional(list(object({
                        bitrate       = optional(number)
                        coding_mode   = optional(string)
                        dialnorm      = optional(number)
                        drc_line      = optional(string)
                        drc_rf        = optional(string)
                        height_trim   = optional(number)
                        surround_trim = optional(number)
                    })))
                    eac3_settings         = optional(list(object({
                        attenuation_control      = optional(string)
                        bitrate                  = optional(number)
                        bitstream_mode           = optional(string)
                        coding_mode              = optional(string)
                        dc_filter                = optional(string)
                        dialnorm                 = optional(number)
                        drc_line                 = optional(string)
                        drc_rf                   = optional(string)
                        lfe_control              = optional(string)
                        lfe_filter               = optional(string)
                        lo_ro_center_mix_level   = optional(number)
                        lo_ro_surround_mix_level = optional(number)
                        lt_rt_center_mix_level   = optional(number)
                        lt_rt_surround_mix_level = optional(number)
                        metadata_control         = optional(string)
                        passthrough_control      = optional(string)
                        phase_control            = optional(string)
                        stereo_downmix           = optional(string)
                        surround_ex_mode         = optional(string)
                        surround_mode            = optional(string)
                    })))
                    mp2_settings          = optional(list(object({
                        bitrate     = optional(number)
                        coding_mode = optional(string)
                        sample_rate = optional(number)
                    })))
                    pass_through_settings = optional(list(object({

                    })))
                    wav_settings          = optional(list(object({
                        bit_depth   = optional(number)
                        coding_mode = optional(string)
                        sample_rate = optional(number)
                    })))
                })))
                remix_settings               = optional(list(object({
                    channels_in      = optional(number)
                    channels_out     = optional(number)
                    channel_mappings = set(object({
                        output_channel       = number
                        input_channel_levels = set(object({
                            gain          = number
                            input_channel = number
                        }))
                    }))
                })))
            })))
            avail_blanking                = optional(list(object({
                state                = optional(string)
                avail_blanking_image = optional(list(object({
                    uri            = string
                    password_param = optional(string)
                    username       = optional(string)
                })))
            })))
            caption_descriptions          = optional(list(object({
                caption_selector_name = string
                name                  = string
                accessibility         = optional(string)
                language_code         = optional(string)
                language_description  = optional(string)
                destination_settings  = optional(list(object({
                    arib_destination_settings                 = optional(list(object({

                    })))
                    burn_in_destination_settings              = optional(list(object({
                        outline_color         = string
                        teletext_grid_control = string
                        alignment             = optional(string)
                        background_color      = optional(string)
                        background_opacity    = optional(number)
                        font_color            = optional(string)
                        font_opacity          = optional(number)
                        font_resolution       = optional(number)
                        font_size             = optional(string)
                        outline_size          = optional(number)
                        shadow_color          = optional(string)
                        shadow_opacity        = optional(number)
                        shadow_x_offset       = optional(number)
                        shadow_y_offset       = optional(number)
                        x_position            = optional(number)
                        y_position            = optional(number)
                        font                  = optional(list(object({
                            uri            = string
                            password_param = optional(string)
                            username       = optional(string)
                        })))
                    })))
                    dvb_sub_destination_settings              = optional(list(object({
                        alignment             = optional(string)
                        background_color      = optional(string)
                        background_opacity    = optional(number)
                        font_color            = optional(string)
                        font_opacity          = optional(number)
                        font_resolution       = optional(number)
                        font_size             = optional(string)
                        outline_color         = optional(string)
                        outline_size          = optional(number)
                        shadow_color          = optional(string)
                        shadow_opacity        = optional(number)
                        shadow_x_offset       = optional(number)
                        shadow_y_offset       = optional(number)
                        teletext_grid_control = optional(string)
                        x_position            = optional(number)
                        y_position            = optional(number)
                        font                  = optional(list(object({
                            uri            = string
                            password_param = optional(string)
                            username       = optional(string)
                        })))
                    })))
                    ebu_tt_d_destination_settings             = optional(list(object({
                        copyright_holder = optional(string)
                        fill_line_gap    = optional(string)
                        font_family      = optional(string)
                        style_control    = optional(string)
                    })))
                    embedded_destination_settings             = optional(list(object({

                    })))
                    embedded_plus_scte20_destination_settings = optional(list(object({

                    })))
                    rtmp_caption_info_destination_settings    = optional(list(object({

                    })))
                    scte20_plus_embedded_destination_settings = optional(list(object({

                    })))
                    scte27_destination_settings               = optional(list(object({

                    })))
                    smpte_tt_destination_settings             = optional(list(object({

                    })))
                    teletext_destination_settings             = optional(list(object({

                    })))
                    ttml_destination_settings                 = optional(list(object({
                        style_control = string
                    })))
                    webvtt_destination_settings               = optional(list(object({
                        style_control = string
                    })))
                })))
            })))
            global_configuration          = optional(list(object({
                initial_audio_gain           = optional(number)
                input_end_action             = optional(string)
                output_locking_mode          = optional(string)
                output_timing_source         = optional(string)
                support_low_framerate_inputs = optional(string)
                input_loss_behavior          = optional(list(object({
                    black_frame_msec       = optional(number)
                    input_loss_image_color = optional(string)
                    input_loss_image_type  = optional(string)
                    repeat_frame_msec      = optional(number)
                    input_loss_image_slate = optional(list(object({
                        uri            = string
                        password_param = optional(string)
                        username       = optional(string)
                    })))
                })))
            })))
            motion_graphics_configuration = optional(list(object({
                motion_graphics_insertion = optional(string)
                motion_graphics_settings  = list(object({
                    html_motion_graphics_settings = optional(list(object({

                    })))
                }))
            })))
            nielsen_configuration         = optional(list(object({
                distributor_id             = optional(string)
                nielsen_pcm_to_id3_tagging = optional(string)
            })))
            output_groups                 = list(object({
                name                  = optional(string)
                output_group_settings = list(object({
                    archive_group_settings       = optional(list(object({
                        rollover_interval    = optional(number)
                        archive_cdn_settings = optional(list(object({
                            archive_s3_settings = optional(list(object({
                                canned_acl = optional(string)
                            })))
                        })))
                        destination          = list(object({
                            destination_ref_id = string
                        }))
                    })))
                    frame_capture_group_settings = optional(list(object({
                        destination                = list(object({
                            destination_ref_id = string
                        }))
                        frame_capture_cdn_settings = optional(list(object({
                            frame_capture_s3_settings = optional(list(object({
                                canned_acl = optional(string)
                            })))
                        })))
                    })))
                    hls_group_settings           = optional(list(object({
                        ad_markers                   = optional(list(string))
                        base_url_content             = optional(string)
                        base_url_content1            = optional(string)
                        base_url_manifest            = optional(string)
                        base_url_manifest1           = optional(string)
                        caption_language_setting     = optional(string)
                        client_cache                 = optional(string)
                        codec_specification          = optional(string)
                        constant_iv                  = optional(string)
                        directory_structure          = optional(string)
                        discontinuity_tags           = optional(string)
                        encryption_type              = optional(string)
                        hls_id3_segment_tagging      = optional(string)
                        iframe_only_playlists        = optional(string)
                        incomplete_segment_behavior  = optional(string)
                        index_n_segments             = optional(number)
                        input_loss_action            = optional(string)
                        iv_in_manifest               = optional(string)
                        iv_source                    = optional(string)
                        keep_segments                = optional(number)
                        key_format                   = optional(string)
                        key_format_versions          = optional(string)
                        manifest_compression         = optional(string)
                        manifest_duration_format     = optional(string)
                        min_segment_length           = optional(number)
                        mode                         = optional(string)
                        output_selection             = optional(string)
                        program_date_time            = optional(string)
                        program_date_time_clock      = optional(string)
                        program_date_time_period     = optional(number)
                        redundant_manifest           = optional(string)
                        segment_length               = optional(number)
                        segments_per_subdirectory    = optional(number)
                        stream_inf_resolution        = optional(string)
                        timed_metadata_id3_frame     = optional(string)
                        timed_metadata_id3_period    = optional(number)
                        timestamp_delta_milliseconds = optional(number)
                        ts_file_mode                 = optional(string)
                        caption_language_mappings    = optional(set(object({
                            caption_channel      = number
                            language_code        = string
                            language_description = string
                        })))
                        destination                  = list(object({
                            destination_ref_id = string
                        }))
                        hls_cdn_settings             = optional(list(object({
                            hls_akamai_settings      = optional(list(object({
                                connection_retry_interval = optional(number)
                                filecache_duration        = optional(number)
                                http_transfer_mode        = optional(string)
                                num_retries               = optional(number)
                                restart_delay             = optional(number)
                                salt                      = optional(string)
                                token                     = optional(string)
                            })))
                            hls_basic_put_settings   = optional(list(object({
                                connection_retry_interval = optional(number)
                                filecache_duration        = optional(number)
                                num_retries               = optional(number)
                                restart_delay             = optional(number)
                            })))
                            hls_media_store_settings = optional(list(object({
                                connection_retry_interval = optional(number)
                                filecache_duration        = optional(number)
                                media_store_storage_class = optional(string)
                                num_retries               = optional(number)
                                restart_delay             = optional(number)
                            })))
                            hls_s3_settings          = optional(list(object({
                                canned_acl = optional(string)
                            })))
                            hls_webdav_settings      = optional(list(object({
                                connection_retry_interval = optional(number)
                                filecache_duration        = optional(number)
                                http_transfer_mode        = optional(string)
                                num_retries               = optional(number)
                                restart_delay             = optional(number)
                            })))
                        })))
                        key_provider_settings        = optional(list(object({
                            static_key_settings = optional(list(object({
                                static_key_value    = string
                                key_provider_server = optional(list(object({
                                    uri            = string
                                    password_param = optional(string)
                                    username       = optional(string)
                                })))
                            })))
                        })))
                    })))
                    media_package_group_settings = optional(list(object({
                        destination = list(object({
                            destination_ref_id = string
                        }))
                    })))
                    ms_smooth_group_settings     = optional(list(object({
                        acquisition_point_id        = optional(string)
                        audio_only_timecode_control = optional(string)
                        certificate_mode            = optional(string)
                        connection_retry_interval   = optional(number)
                        event_id                    = optional(string)
                        event_id_mode               = optional(string)
                        event_stop_behavior         = optional(string)
                        filecache_duration          = optional(number)
                        fragment_length             = optional(number)
                        input_loss_action           = optional(string)
                        num_retries                 = optional(number)
                        restart_delay               = optional(number)
                        segmentation_mode           = optional(string)
                        send_delay_ms               = optional(number)
                        sparse_track_type           = optional(string)
                        stream_manifest_behavior    = optional(string)
                        timestamp_offset            = optional(string)
                        timestamp_offset_mode       = optional(string)
                        destination                 = list(object({
                            destination_ref_id = string
                        }))
                    })))
                    multiplex_group_settings     = optional(list(object({

                    })))
                    rtmp_group_settings          = optional(list(object({
                        ad_markers            = optional(list(string))
                        authentication_scheme = optional(string)
                        cache_full_behavior   = optional(string)
                        cache_length          = optional(number)
                        caption_data          = optional(string)
                        input_loss_action     = optional(string)
                        restart_delay         = optional(number)
                    })))
                    udp_group_settings           = optional(list(object({
                        input_loss_action         = optional(string)
                        timed_metadata_id3_frame  = optional(string)
                        timed_metadata_id3_period = optional(number)
                    })))
                }))
                outputs               = list(object({
                    audio_description_names   = optional(set(string))
                    caption_description_names = optional(set(string))
                    output_name               = optional(string)
                    video_description_name    = optional(string)
                    output_settings           = list(object({
                        archive_output_settings       = optional(list(object({
                            extension          = optional(string)
                            name_modifier      = optional(string)
                            container_settings = optional(list(object({
                                m2ts_settings = optional(list(object({
                                    absent_input_audio_behavior = optional(string)
                                    arib                        = optional(string)
                                    arib_captions_pid           = optional(string)
                                    arib_captions_pid_control   = optional(string)
                                    audio_buffer_model          = optional(string)
                                    audio_frames_per_pes        = optional(number)
                                    audio_pids                  = optional(string)
                                    audio_stream_type           = optional(string)
                                    bitrate                     = optional(number)
                                    buffer_model                = optional(string)
                                    cc_descriptor               = optional(string)
                                    dvb_sub_pids                = optional(string)
                                    dvb_teletext_pid            = optional(string)
                                    ebif                        = optional(string)
                                    ebp_audio_interval          = optional(string)
                                    ebp_lookahead_ms            = optional(number)
                                    ebp_placement               = optional(string)
                                    ecm_pid                     = optional(string)
                                    es_rate_in_pes              = optional(string)
                                    etv_platform_pid            = optional(string)
                                    etv_signal_pid              = optional(string)
                                    fragment_time               = optional(number)
                                    klv                         = optional(string)
                                    klv_data_pids               = optional(string)
                                    nielsen_id3_behavior        = optional(string)
                                    null_packet_bitrate         = optional(number)
                                    pat_interval                = optional(number)
                                    pcr_control                 = optional(string)
                                    pcr_period                  = optional(number)
                                    pcr_pid                     = optional(string)
                                    pmt_interval                = optional(number)
                                    pmt_pid                     = optional(string)
                                    program_num                 = optional(number)
                                    rate_mode                   = optional(string)
                                    scte27_pids                 = optional(string)
                                    scte35_control              = optional(string)
                                    scte35_pid                  = optional(string)
                                    segmentation_markers        = optional(string)
                                    segmentation_style          = optional(string)
                                    segmentation_time           = optional(number)
                                    timed_metadata_behavior     = optional(string)
                                    timed_metadata_pid          = optional(string)
                                    transport_stream_id         = optional(number)
                                    video_pid                   = optional(string)
                                    dvb_nit_settings            = optional(list(object({
                                        network_id   = number
                                        network_name = string
                                        rep_interval = optional(number)
                                    })))
                                    dvb_sdt_settings            = optional(list(object({
                                        output_sdt            = optional(string)
                                        rep_interval          = optional(number)
                                        service_name          = optional(string)
                                        service_provider_name = optional(string)
                                    })))
                                    dvb_tdt_settings            = optional(list(object({
                                        rep_interval = optional(number)
                                    })))
                                })))
                                raw_settings  = optional(list(object({

                                })))
                            })))
                        })))
                        frame_capture_output_settings = optional(list(object({
                            name_modifier = optional(string)
                        })))
                        hls_output_settings           = optional(list(object({
                            h265_packaging_type = optional(string)
                            name_modifier       = optional(string)
                            segment_modifier    = optional(string)
                            hls_settings        = list(object({
                                audio_only_hls_settings    = optional(list(object({
                                    audio_group_id   = optional(string)
                                    audio_track_type = optional(string)
                                    segment_type     = optional(string)
                                    audio_only_image = optional(list(object({
                                        uri            = string
                                        password_param = optional(string)
                                        username       = optional(string)
                                    })))
                                })))
                                fmp4_hls_settings          = optional(list(object({
                                    audio_rendition_sets    = optional(string)
                                    nielsen_id3_behavior    = optional(string)
                                    timed_metadata_behavior = optional(string)
                                })))
                                frame_capture_hls_settings = optional(list(object({

                                })))
                                standard_hls_settings      = optional(list(object({
                                    audio_rendition_sets = optional(string)
                                    m3u8_settings        = list(object({
                                        audio_frames_per_pes    = optional(number)
                                        audio_pids              = optional(string)
                                        ecm_pid                 = optional(string)
                                        nielsen_id3_behavior    = optional(string)
                                        pat_interval            = optional(number)
                                        pcr_control             = optional(string)
                                        pcr_period              = optional(number)
                                        pcr_pid                 = optional(string)
                                        pmt_interval            = optional(number)
                                        pmt_pid                 = optional(string)
                                        program_num             = optional(number)
                                        scte35_behavior         = optional(string)
                                        scte35_pid              = optional(string)
                                        timed_metadata_behavior = optional(string)
                                        timed_metadata_pid      = optional(string)
                                        transport_stream_id     = optional(number)
                                        video_pid               = optional(string)
                                    }))
                                })))
                            }))
                        })))
                        media_package_output_settings = optional(list(object({

                        })))
                        ms_smooth_output_settings     = optional(list(object({
                            h265_packaging_type = optional(string)
                            name_modifier       = optional(string)
                        })))
                        multiplex_output_settings     = optional(list(object({
                            destination = list(object({
                                destination_ref_id = string
                            }))
                        })))
                        rtmp_output_settings          = optional(list(object({
                            certificate_mode          = optional(string)
                            connection_retry_interval = optional(number)
                            num_retries               = optional(number)
                            destination               = list(object({
                                destination_ref_id = string
                            }))
                        })))
                        udp_output_settings           = optional(list(object({
                            buffer_msec         = optional(number)
                            container_settings  = list(object({
                                m2ts_settings = optional(list(object({
                                    absent_input_audio_behavior = optional(string)
                                    arib                        = optional(string)
                                    arib_captions_pid           = optional(string)
                                    arib_captions_pid_control   = optional(string)
                                    audio_buffer_model          = optional(string)
                                    audio_frames_per_pes        = optional(number)
                                    audio_pids                  = optional(string)
                                    audio_stream_type           = optional(string)
                                    bitrate                     = optional(number)
                                    buffer_model                = optional(string)
                                    cc_descriptor               = optional(string)
                                    dvb_sub_pids                = optional(string)
                                    dvb_teletext_pid            = optional(string)
                                    ebif                        = optional(string)
                                    ebp_audio_interval          = optional(string)
                                    ebp_lookahead_ms            = optional(number)
                                    ebp_placement               = optional(string)
                                    ecm_pid                     = optional(string)
                                    es_rate_in_pes              = optional(string)
                                    etv_platform_pid            = optional(string)
                                    etv_signal_pid              = optional(string)
                                    fragment_time               = optional(number)
                                    klv                         = optional(string)
                                    klv_data_pids               = optional(string)
                                    nielsen_id3_behavior        = optional(string)
                                    null_packet_bitrate         = optional(number)
                                    pat_interval                = optional(number)
                                    pcr_control                 = optional(string)
                                    pcr_period                  = optional(number)
                                    pcr_pid                     = optional(string)
                                    pmt_interval                = optional(number)
                                    pmt_pid                     = optional(string)
                                    program_num                 = optional(number)
                                    rate_mode                   = optional(string)
                                    scte27_pids                 = optional(string)
                                    scte35_control              = optional(string)
                                    scte35_pid                  = optional(string)
                                    segmentation_markers        = optional(string)
                                    segmentation_style          = optional(string)
                                    segmentation_time           = optional(number)
                                    timed_metadata_behavior     = optional(string)
                                    timed_metadata_pid          = optional(string)
                                    transport_stream_id         = optional(number)
                                    video_pid                   = optional(string)
                                    dvb_nit_settings            = optional(list(object({
                                        network_id   = number
                                        network_name = string
                                        rep_interval = optional(number)
                                    })))
                                    dvb_sdt_settings            = optional(list(object({
                                        output_sdt            = optional(string)
                                        rep_interval          = optional(number)
                                        service_name          = optional(string)
                                        service_provider_name = optional(string)
                                    })))
                                    dvb_tdt_settings            = optional(list(object({
                                        rep_interval = optional(number)
                                    })))
                                })))
                            }))
                            destination         = list(object({
                                destination_ref_id = string
                            }))
                            fec_output_settings = optional(list(object({
                                column_depth = optional(number)
                                include_fec  = optional(string)
                                row_length   = optional(number)
                            })))
                        })))
                    }))
                }))
            }))
            timecode_config               = list(object({
                source         = string
                sync_threshold = optional(number)
            }))
            video_descriptions            = optional(list(object({
                name             = string
                height           = optional(number)
                respond_to_afd   = optional(string)
                scaling_behavior = optional(string)
                sharpness        = optional(number)
                width            = optional(number)
                codec_settings   = optional(list(object({
                    frame_capture_settings = optional(list(object({
                        capture_interval       = optional(number)
                        capture_interval_units = optional(string)
                    })))
                    h264_settings          = optional(list(object({
                        adaptive_quantization   = optional(string)
                        afd_signaling           = optional(string)
                        bitrate                 = optional(number)
                        buf_fill_pct            = optional(number)
                        buf_size                = optional(number)
                        color_metadata          = optional(string)
                        entropy_encoding        = optional(string)
                        fixed_afd               = optional(string)
                        flicker_aq              = optional(string)
                        force_field_pictures    = optional(string)
                        framerate_control       = optional(string)
                        framerate_denominator   = optional(number)
                        framerate_numerator     = optional(number)
                        gop_b_reference         = optional(string)
                        gop_closed_cadence      = optional(number)
                        gop_num_b_frames        = optional(number)
                        gop_size                = optional(number)
                        gop_size_units          = optional(string)
                        level                   = optional(string)
                        look_ahead_rate_control = optional(string)
                        max_bitrate             = optional(number)
                        min_i_interval          = optional(number)
                        num_ref_frames          = optional(number)
                        par_control             = optional(string)
                        par_denominator         = optional(number)
                        par_numerator           = optional(number)
                        profile                 = optional(string)
                        quality_level           = optional(string)
                        qvbr_quality_level      = optional(number)
                        rate_control_mode       = optional(string)
                        scan_type               = optional(string)
                        scene_change_detect     = optional(string)
                        slices                  = optional(number)
                        softness                = optional(number)
                        spatial_aq              = optional(string)
                        subgop_length           = optional(string)
                        syntax                  = optional(string)
                        temporal_aq             = optional(string)
                        timecode_insertion      = optional(string)
                        filter_settings         = optional(list(object({
                            temporal_filter_settings = optional(list(object({
                                post_filter_sharpening = optional(string)
                                strength               = optional(string)
                            })))
                        })))
                    })))
                    h265_settings          = optional(list(object({
                        bitrate                       = number
                        framerate_denominator         = number
                        framerate_numerator           = number
                        adaptive_quantization         = optional(string)
                        afd_signaling                 = optional(string)
                        alternative_transfer_function = optional(string)
                        buf_size                      = optional(number)
                        color_metadata                = optional(string)
                        fixed_afd                     = optional(string)
                        flicker_aq                    = optional(string)
                        gop_closed_cadence            = optional(number)
                        gop_size                      = optional(number)
                        gop_size_units                = optional(string)
                        level                         = optional(string)
                        look_ahead_rate_control       = optional(string)
                        max_bitrate                   = optional(number)
                        min_i_interval                = optional(number)
                        min_qp                        = optional(number)
                        mv_over_picture_boundaries    = optional(string)
                        mv_temporal_predictor         = optional(string)
                        par_denominator               = optional(number)
                        par_numerator                 = optional(number)
                        profile                       = optional(string)
                        qvbr_quality_level            = optional(number)
                        rate_control_mode             = optional(string)
                        scan_type                     = optional(string)
                        scene_change_detect           = optional(string)
                        slices                        = optional(number)
                        tier                          = optional(string)
                        tile_height                   = optional(number)
                        tile_padding                  = optional(string)
                        tile_width                    = optional(number)
                        timecode_insertion            = optional(string)
                        treeblock_size                = optional(string)
                        color_space_settings          = optional(list(object({
                            color_space_passthrough_settings = optional(list(object({

                            })))
                            dolby_vision81_settings          = optional(list(object({

                            })))
                            hdr10_settings                   = optional(list(object({
                                max_cll  = optional(number)
                                max_fall = optional(number)
                            })))
                            rec601_settings                  = optional(list(object({

                            })))
                            rec709_settings                  = optional(list(object({

                            })))
                        })))
                        filter_settings               = optional(list(object({
                            temporal_filter_settings = optional(list(object({
                                post_filter_sharpening = optional(string)
                                strength               = optional(string)
                            })))
                        })))
                        timecode_burnin_settings      = optional(list(object({
                            prefix                    = optional(string)
                            timecode_burnin_font_size = optional(string)
                            timecode_burnin_position  = optional(string)
                        })))
                    })))
                })))
            })))
        }))
    input_attachments       = set(object({
            input_attachment_name             = string
            input_id                          = string
            automatic_input_failover_settings = optional(list(object({
                secondary_input_id    = string
                error_clear_time_msec = optional(number)
                input_preference      = optional(string)
                failover_condition    = optional(set(object({
                    failover_condition_settings = optional(list(object({
                        audio_silence_settings = optional(list(object({
                            audio_selector_name          = string
                            audio_silence_threshold_msec = optional(number)
                        })))
                        input_loss_settings    = optional(list(object({
                            input_loss_threshold_msec = optional(number)
                        })))
                        video_black_settings   = optional(list(object({
                            black_detect_threshold     = optional(number)
                            video_black_threshold_msec = optional(number)
                        })))
                    })))
                })))
            })))
            input_settings                    = optional(list(object({
                deblock_filter            = optional(string)
                denoise_filter            = optional(string)
                filter_strength           = optional(number)
                input_filter              = optional(string)
                scte35_pid                = optional(number)
                smpte2038_data_preference = optional(string)
                source_end_behavior       = optional(string)
                audio_selector            = optional(list(object({
                    name              = string
                    selector_settings = optional(list(object({
                        audio_hls_rendition_selection = optional(list(object({
                            group_id = string
                            name     = string
                        })))
                        audio_language_selection      = optional(list(object({
                            language_code             = string
                            language_selection_policy = optional(string)
                        })))
                        audio_pid_selection           = optional(list(object({
                            pid = number
                        })))
                        audio_track_selection         = optional(list(object({
                            dolby_e_decode = optional(list(object({
                                program_selection = string
                            })))
                            tracks         = set(object({
                                track = number
                            }))
                        })))
                    })))
                })))
                caption_selector          = optional(list(object({
                    name              = string
                    language_code     = optional(string)
                    selector_settings = optional(list(object({
                        ancillary_source_settings = optional(list(object({
                            source_ancillary_channel_number = optional(number)
                        })))
                        arib_source_settings      = optional(list(object({

                        })))
                        dvb_sub_source_settings   = optional(list(object({
                            ocr_language = optional(string)
                            pid          = optional(number)
                        })))
                        embedded_source_settings  = optional(list(object({
                            convert_608_to_708        = optional(string)
                            scte20_detection          = optional(string)
                            source_608_channel_number = optional(number)
                        })))
                        scte20_source_settings    = optional(list(object({
                            convert_608_to_708        = optional(string)
                            source_608_channel_number = optional(number)
                        })))
                        scte27_source_settings    = optional(list(object({
                            ocr_language = optional(string)
                            pid          = optional(number)
                        })))
                        teletext_source_settings  = optional(list(object({
                            page_number      = optional(string)
                            output_rectangle = optional(list(object({
                                height      = number
                                left_offset = number
                                top_offset  = number
                                width       = number
                            })))
                        })))
                    })))
                })))
                network_input_settings    = optional(list(object({
                    server_validation  = optional(string)
                    hls_input_settings = optional(list(object({
                        bandwidth       = optional(number)
                        buffer_segments = optional(number)
                        retries         = optional(number)
                        retry_interval  = optional(number)
                        scte35_source   = optional(string)
                    })))
                })))
                video_selector            = optional(list(object({
                    color_space       = optional(string)
                    color_space_usage = optional(string)
                })))
            })))
        }))
    input_specification     = list(object({
            codec            = string
            input_resolution = string
            maximum_bitrate  = string
        }))
    maintenance             = optional(list(object({
            maintenance_day        = string
            maintenance_start_time = string
        })))
    vpc                     = optional(list(object({
            public_address_allocation_ids = list(string)
            subnet_ids                    = set(string)
            security_group_ids            = optional(set(string))
        })))
  }))
}
