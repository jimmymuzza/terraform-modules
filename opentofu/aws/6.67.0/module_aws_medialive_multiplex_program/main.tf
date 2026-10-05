resource "aws_medialive_multiplex_program" "medialive_multiplex_programs" {
  for_each = var.medialive_multiplex_programs

  multiplex_id = each.value.multiplex_id
  program_name = each.value.program_name
  region       = each.value.region

  dynamic "multiplex_program_settings" {
    for_each = each.value.multiplex_program_settings != null ? each.value.multiplex_program_settings : []
    content {
      preferred_channel_pipeline = multiplex_program_settings.value.preferred_channel_pipeline
      program_number             = multiplex_program_settings.value.program_number

      dynamic "service_descriptor" {
        for_each = multiplex_program_settings.value.service_descriptor != null ? multiplex_program_settings.value.service_descriptor : []
        content {
          provider_name = service_descriptor.value.provider_name
          service_name  = service_descriptor.value.service_name
        }
      }

      dynamic "video_settings" {
        for_each = multiplex_program_settings.value.video_settings != null ? multiplex_program_settings.value.video_settings : []
        content {
          constant_bitrate = video_settings.value.constant_bitrate

          dynamic "statmux_settings" {
            for_each = video_settings.value.statmux_settings != null ? video_settings.value.statmux_settings : []
            content {
              maximum_bitrate = statmux_settings.value.maximum_bitrate
              minimum_bitrate = statmux_settings.value.minimum_bitrate
              priority        = statmux_settings.value.priority
            }
          }
        }
      }
    }
  }
}
