variable "sagemaker_image_versions" {
  description = <<EOT
Map of sagemaker_image_versions, attributes below
Required:
    - base_image
    - image_name
Optional:
    - aliases
    - horovod
    - job_type
    - ml_framework
    - processor
    - programming_lang
    - region
    - release_notes
    - vendor_guidance
EOT

  type = map(object({
    base_image       = string
    image_name       = string
    aliases          = optional(set(string))
    horovod          = optional(bool)
    job_type         = optional(string)
    ml_framework     = optional(string)
    processor        = optional(string)
    programming_lang = optional(string)
    region           = optional(string)
    release_notes    = optional(string)
    vendor_guidance  = optional(string)
  }))
}
