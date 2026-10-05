variable "s3control_object_lambda_access_points" {
  description = <<EOT
Map of s3control_object_lambda_access_points, attributes below
Required:
    - name
    - configuration
Optional:
    - account_id
    - region
EOT

  type = map(object({
    name          = string
    account_id    = optional(string)
    region        = optional(string)
    configuration = list(object({
            supporting_access_point      = string
            allowed_features             = optional(set(string))
            cloud_watch_metrics_enabled  = optional(bool)
            transformation_configuration = set(object({
                actions                = set(string)
                content_transformation = list(object({
                    aws_lambda = list(object({
                        function_arn     = string
                        function_payload = optional(string)
                    }))
                }))
            }))
        }))
  }))
}
