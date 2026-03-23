variable "signer_signing_jobs" {
  description = <<EOT
Map of signer_signing_jobs, attributes below
Required:
    - profile_name
    - destination
    - source
Optional:
    - ignore_signing_job_failure
    - region
EOT

  type = map(object({
    profile_name               = string
    ignore_signing_job_failure = optional(bool)
    region                     = optional(string)
    destination                = list(object({
            s3 = list(object({
                bucket = string
                prefix = optional(string)
            }))
        }))
    source                     = list(object({
            s3 = list(object({
                bucket  = string
                key     = string
                version = string
            }))
        }))
  }))
}
