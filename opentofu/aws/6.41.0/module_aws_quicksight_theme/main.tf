resource "aws_quicksight_theme" "quicksight_themes" {
  for_each = var.quicksight_themes

  base_theme_id       = each.value.base_theme_id
  name                = each.value.name
  theme_id            = each.value.theme_id
  aws_account_id      = each.value.aws_account_id
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all
  version_description = each.value.version_description

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "data_color_palette" {
        for_each = configuration.value.data_color_palette != null ? configuration.value.data_color_palette : []
        content {
          colors           = data_color_palette.value.colors
          empty_fill_color = data_color_palette.value.empty_fill_color
          min_max_gradient = data_color_palette.value.min_max_gradient
        }
      }

      dynamic "sheet" {
        for_each = configuration.value.sheet != null ? configuration.value.sheet : []
        content {

          dynamic "tile" {
            for_each = sheet.value.tile != null ? sheet.value.tile : []
            content {

              dynamic "border" {
                for_each = tile.value.border != null ? tile.value.border : []
                content {
                  show = border.value.show
                }
              }
            }
          }

          dynamic "tile_layout" {
            for_each = sheet.value.tile_layout != null ? sheet.value.tile_layout : []
            content {

              dynamic "gutter" {
                for_each = tile_layout.value.gutter != null ? tile_layout.value.gutter : []
                content {
                  show = gutter.value.show
                }
              }

              dynamic "margin" {
                for_each = tile_layout.value.margin != null ? tile_layout.value.margin : []
                content {
                  show = margin.value.show
                }
              }
            }
          }
        }
      }

      dynamic "typography" {
        for_each = configuration.value.typography != null ? configuration.value.typography : []
        content {

          dynamic "font_families" {
            for_each = typography.value.font_families != null ? typography.value.font_families : []
            content {
              font_family = font_families.value.font_family
            }
          }
        }
      }

      dynamic "ui_color_palette" {
        for_each = configuration.value.ui_color_palette != null ? configuration.value.ui_color_palette : []
        content {
          accent               = ui_color_palette.value.accent
          accent_foreground    = ui_color_palette.value.accent_foreground
          danger               = ui_color_palette.value.danger
          danger_foreground    = ui_color_palette.value.danger_foreground
          dimension            = ui_color_palette.value.dimension
          dimension_foreground = ui_color_palette.value.dimension_foreground
          measure              = ui_color_palette.value.measure
          measure_foreground   = ui_color_palette.value.measure_foreground
          primary_background   = ui_color_palette.value.primary_background
          primary_foreground   = ui_color_palette.value.primary_foreground
          secondary_background = ui_color_palette.value.secondary_background
          secondary_foreground = ui_color_palette.value.secondary_foreground
          success              = ui_color_palette.value.success
          success_foreground   = ui_color_palette.value.success_foreground
          warning              = ui_color_palette.value.warning
          warning_foreground   = ui_color_palette.value.warning_foreground
        }
      }
    }
  }

  dynamic "permissions" {
    for_each = each.value.permissions != null ? each.value.permissions : []
    content {
      actions   = permissions.value.actions
      principal = permissions.value.principal
    }
  }
}
