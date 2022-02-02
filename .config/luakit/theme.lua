--------------------------
-- Dracula luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "12px FiraCode Nerd Font"
theme.bg   = "#282A36"
theme.fg   = "#F8F8F2"

-- Genaral colours
theme.success_fg = "#50FA7B"
theme.loaded_fg  = "#33AADD"
theme.error_fg = theme.fg
theme.error_bg = "#FF5555"

-- Warning colours
theme.warning_fg = "#FF5555"
theme.warning_bg = theme.fg

-- Notification colours
theme.notif_fg = "#4D4D4D"
theme.notif_bg = theme.fg

-- Menu colours
theme.menu_fg                   = theme.fg
theme.menu_bg                   = theme.bg
theme.menu_selected_fg          = theme.bg
theme.menu_selected_bg          = "#F1FA8C"
theme.menu_title_bg             = "#4D4D4D"
theme.menu_primary_title_fg     = "#FF5555"
theme.menu_secondary_title_fg   = "#4D4D4D"

theme.menu_disabled_fg = "#BFBFBF"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#5AF78E"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = theme.fg
theme.proxy_active_menu_bg      = theme.bg
theme.proxy_inactive_menu_fg    = theme.fg
theme.proxy_inactive_menu_bg    = '#BFBFBF'

-- Statusbar specific
theme.sbar_fg         = theme.fg
theme.sbar_bg         = theme.bg

-- Downloadbar specific
theme.dbar_fg         = theme.fg
theme.dbar_bg         = theme.bg
theme.dbar_error_fg   = "#FF5555"

-- Input bar specific
theme.ibar_fg           = theme.fg
theme.ibar_bg           = theme.bg

-- Tab label
theme.tab_fg            = "#BFBFBF"
theme.tab_bg            = "#4D4D4D"
theme.tab_hover_bg      = theme.bg
theme.tab_ntheme        = "#e6e6e6"
theme.selected_fg       = theme.fg
theme.selected_bg       = theme.bg
theme.selected_ntheme   = theme.bg
theme.loading_fg        = "#9AEDFE"
theme.loading_bg        = theme.bg

theme.selected_private_tab_bg = "#CAA9FA"
theme.private_tab_bg    = "#BD93F9"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#5AF78E"
theme.notrust_fg        = "#FF6E67"

-- Follow mode hints
theme.hint_font = "10px FiraCode Nerd Font Mono, courier, sans-serif"
theme.hint_fg = theme.fg
theme.hint_bg = theme.bg
theme.hint_border = "1px dashed #000"
theme.hint_opacity = "0.3"
theme.hint_overlay_bg = "rgba(255,255,153,0.3)"
theme.hint_overlay_border = "1px dotted #282A36"
theme.hint_overlay_selected_bg = "rgba(0,255,0,0.3)"
theme.hint_overlay_selected_border = theme.hint_overlay_border

-- General colour pairings
theme.ok = { fg = theme.fg, bg = theme.bg }
theme.warn = { fg = "#FF5555", bg = theme.bg }
theme.error = { fg = theme.fg, bg = "#FF5555" }

-- Gopher page style (override defaults)
theme.gopher_light = { bg = "#E8E8E8", fg = "#17181C", link = "#03678D" }
theme.gopher_dark  = { bg = "#17181C", fg = "#E8E8E8", link = "#f90" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
