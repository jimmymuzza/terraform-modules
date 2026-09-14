variable "ivs_playback_key_pairs" {
  description = <<EOT
Map of ivs_playback_key_pairs, attributes below
Required:
    - public_key
Optional:
    - name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    public_key = string
    name       = optional(string)
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
  }))
}
