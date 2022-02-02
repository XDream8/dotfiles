--------------------------
-- Dracula luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "12px FiraCode Nerd Font"
theme.fg   = "#f8f8f2"

-- Genaral colours
theme.success_fg = "#50FA7B"
theme.loaded_fg  = "#33AADD"
theme.error_fg = "#f8f8f2"
theme.error_bg = "#FF5555"

-- Warning colours
theme.warning_fg = "#FF5555"
theme.warning_bg = "#f8f8f2"

-- Notification colours
theme.notif_fg = "#4D4D4D"
theme.notif_bg = "#f8f8f2"

-- Menu colours
theme.menu_fg                   = "#f8f8f2"
theme.menu_bg                   = "#282A36"
theme.menu_selected_fg          = "#282A36"
theme.menu_selected_bg          = "#F1FA8C"
theme.menu_title_bg             = "#f8f8f2"
theme.menu_primary_title_fg     = "#FF5555"
theme.menu_secondary_title_fg   = "#4D4D4D"

theme.menu_disabled_fg = "#BFBFBF"
theme.menu_disabled_bg = theme.menu_bg
theme.menu_enabled_fg = theme.menu_fg
theme.menu_enabled_bg = theme.menu_bg
theme.menu_active_fg = "#5AF78E"
theme.menu_active_bg = theme.menu_bg

-- Proxy manager
theme.proxy_active_menu_fg      = '#f8f8f2'
theme.proxy_active_menu_bg      = '#282A36'
theme.proxy_inactive_menu_fg    = '#f8f8f2'
theme.proxy_inactive_menu_bg    = '#BFBFBF'

-- Statusbar specific
theme.sbar_fg         = "#f8f8f2"
theme.sbar_bg         = "#282A36"

-- Downloadbar specific
theme.dbar_fg         = "#f8f8f2"
theme.dbar_bg         = "#282A36"
theme.dbar_error_fg   = "#FF5555"

-- Input bar specific
theme.ibar_fg           = "#282A36"
theme.ibar_bg           = "rgba(0,0,0,0)"

-- Tab label
theme.tab_fg            = "#BFBFBF"
theme.tab_bg            = "#4D4D4D"
theme.tab_hover_bg      = "#282A36"
theme.tab_ntheme        = "#e6e6e6"
theme.selected_fg       = "#f8f8f2"
theme.selected_bg       = "#282A36"
theme.selected_ntheme   = "#282A36"
theme.loading_fg        = "#9AEDFE"
theme.loading_bg        = "#282A36"

theme.selected_private_tab_bg = "#CAA9FA"
theme.private_tab_bg    = "#BD93F9"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#5AF78E"
theme.notrust_fg        = "#FF6E67"

-- Follow mode hints
theme.hint_font = "10px monospace, courier, sans-serif"
theme.hint_fg = "#f8f8f2"
theme.hint_bg = "#282A36"
theme.hint_border = "1px dashed #000"
theme.hint_opacity = "0.3"
theme.hint_overlay_bg = "rgba(255,255,153,0.3)"
theme.hint_overlay_border = "1px dotted #000"
theme.hint_overlay_selected_bg = "rgba(0,255,0,0.3)"
theme.hint_overlay_selected_border = theme.hint_overlay_border

-- General colour pairings
theme.ok = { fg = "#f8f8f2", bg = "#282A36" }
theme.warn = { fg = "#FF5555", bg = "#282A36" }
theme.error = { fg = "#f8f8f2", bg = "#FF5555" }

-- Gopher page style (override defaults)
theme.gopher_light = { bg = "#E8E8E8", fg = "#17181C", link = "#03678D" }
theme.gopher_dark  = { bg = "#17181C", fg = "#E8E8E8", link = "#f90" }

return theme

-- vim: et:sw=4:ts=8:sts=4:tw=80
