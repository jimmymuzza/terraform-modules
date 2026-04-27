variable "medialive_multiplexes" {
  description = <<EOT
Map of medialive_multiplexes, attributes below
Required:
    - availability_zones
    - name
Optional:
    - region
    - start_multiplex
    - tags
    - tags_all
    - multiplex_settings
EOT

  type = map(object({
    availability_zones = list(string)
    name               = string
    region             = optional(string)
    start_multiplex    = optional(bool)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    multiplex_settings = optional(list(object({
            transport_stream_bitrate                = number
            transport_stream_id                     = number
            maximum_video_buffer_delay_milliseconds = optional(number)
            transport_stream_reserved_bitrate       = optional(number)
        })))
  }))
}
