local modes = require "modes"

modes.add_binds("normal", {{
    "<Control-c>",
    "Copy selected text.",
    function ()
        luakit.selection.clipboard = luakit.selection.primary
    end
}})

local settings = require "settings"

settings.webview.enable_mediasource = true
settings.webview.enable_media_stream = true
settings.undoclose.max_saved_tabs = 10
settings.application.prefer_dark_mode = true
-- settings.webview.user_agent = "Mozilla/5.0 (X11; Linux i686; rv:96.0) Gecko/20100101 Firefox/96.0)"
settings.window.home_page = "https://start.duckduckgo.com"
settings.window.zoom_step = 0.2
