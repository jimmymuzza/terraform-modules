variable "fis_safety_lever_states" {
  description = <<EOT
Map of fis_safety_lever_states, attributes below
Optional:
    - region
    - state
EOT

  type = map(object({
    region = optional(string)
    state  = optional(list(object({
            reason = string
            status = string
        })))
  }))
}
