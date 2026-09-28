variable "cloudfront_realtime_log_configs" {
  description = <<EOT
Map of cloudfront_realtime_log_configs, attributes below
Required:
    - fields
    - name
    - sampling_rate
    - endpoint
EOT

  type = map(object({
    fields        = set(string)
    name          = string
    sampling_rate = number
    endpoint      = list(object({
            stream_type           = string
            kinesis_stream_config = list(object({
                role_arn   = string
                stream_arn = string
            }))
        }))
  }))
}
