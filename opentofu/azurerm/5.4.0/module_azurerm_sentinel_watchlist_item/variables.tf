variable "sentinel_watchlist_items" {
  description = <<EOT
Map of sentinel_watchlist_items, attributes below
Required:
    - properties
    - watchlist_id
Optional:
    - name
EOT

  type = map(object({
    properties   = map(string)
    watchlist_id = string
    name         = optional(string)
  }))
}
