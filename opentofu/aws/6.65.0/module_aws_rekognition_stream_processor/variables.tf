variable "rekognition_stream_processors" {
  description = <<EOT
Map of rekognition_stream_processors, attributes below
Required:
    - name
    - role_arn
Optional:
    - kms_key_id
    - region
    - tags
    - data_sharing_preference
    - input
    - notification_channel
    - output
    - regions_of_interest
    - settings
EOT

  type = map(object({
    name                    = string
    role_arn                = string
    kms_key_id              = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    data_sharing_preference = optional(list(object({
            opt_in = bool
        })))
    input                   = optional(list(object({
            kinesis_video_stream = optional(list(object({
                arn = string
            })))
        })))
    notification_channel    = optional(list(object({
            sns_topic_arn = optional(string)
        })))
    output                  = optional(list(object({
            kinesis_data_stream = optional(list(object({
                arn = optional(string)
            })))
            s3_destination      = optional(list(object({
                bucket     = optional(string)
                key_prefix = optional(string)
            })))
        })))
    regions_of_interest     = optional(list(object({
            bounding_box = optional(list(object({
                height = optional(number)
                left   = optional(number)
                top    = optional(number)
                width  = optional(number)
            })))
            polygon      = optional(list(object({
                x = optional(number)
                y = optional(number)
            })))
        })))
    settings                = optional(list(object({
            connected_home = optional(list(object({
                labels         = optional(list(string))
                min_confidence = optional(number)
            })))
            face_search    = optional(list(object({
                collection_id        = string
                face_match_threshold = optional(number)
            })))
        })))
  }))
}
