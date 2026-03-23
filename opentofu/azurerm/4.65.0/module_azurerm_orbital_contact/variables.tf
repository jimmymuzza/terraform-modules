variable "orbital_contacts" {
  description = <<EOT
Map of orbital_contacts, attributes below
Required:
    - contact_profile_id
    - ground_station_name
    - name
    - reservation_end_time
    - reservation_start_time
    - spacecraft_id
EOT

  type = map(object({
    contact_profile_id     = string
    ground_station_name    = string
    name                   = string
    reservation_end_time   = string
    reservation_start_time = string
    spacecraft_id          = string
  }))
}
