variable "quicksight_themes" {
  description = <<EOT
Map of quicksight_themes, attributes below
Required:
    - base_theme_id
    - name
    - theme_id
Optional:
    - aws_account_id
    - region
    - tags
    - tags_all
    - version_description
    - configuration
    - permissions
EOT

  type = map(object({
    base_theme_id       = string
    name                = string
    theme_id            = string
    aws_account_id      = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    version_description = optional(string)
    configuration       = optional(list(object({
            data_color_palette = optional(list(object({
                colors           = optional(list(string))
                empty_fill_color = optional(string)
                min_max_gradient = optional(list(string))
            })))
            sheet              = optional(list(object({
                tile        = optional(list(object({
                    border = optional(list(object({
                        show = optional(bool)
                    })))
                })))
                tile_layout = optional(list(object({
                    gutter = optional(list(object({
                        show = optional(bool)
                    })))
                    margin = optional(list(object({
                        show = optional(bool)
                    })))
                })))
            })))
            typography         = optional(list(object({
                font_families = optional(list(object({
                    font_family = optional(string)
                })))
            })))
            ui_color_palette   = optional(list(object({
                accent               = optional(string)
                accent_foreground    = optional(string)
                danger               = optional(string)
                danger_foreground    = optional(string)
                dimension            = optional(string)
                dimension_foreground = optional(string)
                measure              = optional(string)
                measure_foreground   = optional(string)
                primary_background   = optional(string)
                primary_foreground   = optional(string)
                secondary_background = optional(string)
                secondary_foreground = optional(string)
                success              = optional(string)
                success_foreground   = optional(string)
                warning              = optional(string)
                warning_foreground   = optional(string)
            })))
        })))
    permissions         = optional(set(object({
            actions   = set(string)
            principal = string
        })))
  }))
}
