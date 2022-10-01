config.load_autoconfig(False)

c.content.notifications.enabled = False
c.content.blocking.method = 'both'
c.content.blocking.adblock.lists = ['https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt', 'https://easylist.to/easylist/easylist.txt', 'https://easylist.to/easylist/easyprivacy.txt', 'https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_13_Turkish/filter.txt','/home/xdream8/.config/qutebrowser/lol.txt']
c.content.cookies.accept = 'no-3rdparty'

# variables
darkgrey = "#030303"
lessdarkgrey = "#3e3e3e"
midgrey = "#808080"
white = "#ffffff"
magenta = "#ff009e"
cyan = "#00fff9"
yellow = "#ffdb00"
red = "#ff0000"

# startpage = "https://start.duckduckgo.com"
startpage = "https://searx.lukesmith.xyz"

# ui n ting
c.auto_save.session = True
c.content.autoplay = False
c.statusbar.show = 'never'
c.fonts.default_family = 'IBM Plex Mono'
c.fonts.default_size = "11pt"
c.messages.timeout = 5000
c.content.fullscreen.overlay_timeout = 0
c.editor.command = ['st', '-e', 'vim', '{file}', '-c', 'normal {line}G{column0}l']
c.scrolling.bar = 'never'
c.completion.open_categories = ['quickmarks', 'searchengines', 'history']
c.url.start_pages = startpage
c.url.default_page = startpage
c.content.fullscreen.window = True
# c.spellcheck.languages = ['en-GB']
c.content.user_stylesheets = '~/.config/qutebrowser/lol.css'
c.content.tls.certificate_errors = 'load-insecurely'
c.colors.webpage.darkmode.enabled = False

# tabs
c.tabs.background = True
c.tabs.last_close = 'startpage'
c.tabs.show = 'always'
c.tabs.favicons.scale = 1
c.tabs.indicator.padding = {"top": 0, "right": 0, "bottom": 0, "left": 0}
c.tabs.position = "left"
c.tabs.title.format = '{index}'
c.tabs.width = 49
c.tabs.indicator.width = 0
c.tabs.padding = {"top": 2, "right": 2, "bottom": 2, "left": 5}


# keys
config.bind('<Ctrl-e>', 'open-editor')
config.bind('M', 'spawn mpv --volume=50 {url}')
config.bind('<Ctrl-m>', 'hint links spawn mpv --volume=50 {hint-url}')
config.bind('zp', 'spawn --userscript ~/.config/qutebrowser/password_fill')
config.bind('<Ctrl-s>', 'config-cycle -t tabs.show always never')
config.bind('b', 'config-cycle -t statusbar.show always never')
config.bind('zi', 'hint inputs')
config.bind('<Ctrl-Shift-f>', 'hint links tab-fg')
config.bind('E', 'config-edit')
config.bind('e', 'set-cmd-text -s :tab-select')

# search
c.url.open_base_url = True
c.url.searchengines = {
"DEFAULT": "https://duckduckgo.com/?q={}",
"gg": "https://www.google.co.uk/search?&q={}",
"ggi": "https://www.google.co.uk/search?q={}&tbm=isch",
"w": "https://en.wikipedia.org/w/index.php?search={}",
"st": "http://store.steampowered.com/search/?term={}",
"g": "https://duckduckgo.com/?q={}",
"mw": "http://en.uesp.net/w/index.php?title=Special%3ASearch&search={}",
"aur": "https://aur.archlinux.org/packages/?O=0&K={}",
"pac": "https://www.archlinux.org/packages/?sort=&arch=x86_64&maintainer=&flagged=&q={}",
"nh": "https://nethackwiki.com/wiki/index.php?search={}",
"aw": "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}",
"gw": "https://wiki.gentoo.org/index.php?title=Special%3ASearch&search={}&go=Go",
"i": "http://www.imdb.com/find?ref_=nv_sr_fn&s=all&q={}",
"dick": "https://en.wiktionary.org/wiki/{}",
"ety": "http://www.etymonline.com/index.php?allowed_in_frame=0&search={}",
"u": "http://www.urbandictionary.com/define.php?term={}",
"y": "https://www.youtube.com/results?search_query={}",
"r": "https://old.reddit.com/r/{}/new/",
"it": "https://itch.io/search?q={}",
"tpb": "https://www.magnetdl.com/search/?m=1&q={}",
"gi": "https://duckduckgo.com/?q={}&iar=images",
"p": "https://www.protondb.com/search?q={}",
"a": "https://smile.amazon.co.uk/s/?url=search-alias&field-keywords={}",
"gt": "https://translate.google.com/#view=home&op=translate&sl=auto&tl=en&text={}",
"trig": "https://trigedasleng.net/search?q={}",
"rt": "https://www.rottentomatoes.com/search?search={}",
}

# styling
c.colors.completion.category.bg = darkgrey
c.colors.completion.category.border.bottom = white
c.colors.completion.category.border.top = darkgrey
c.colors.completion.category.fg = white
c.colors.completion.even.bg = darkgrey
c.colors.completion.odd.bg = darkgrey
c.colors.completion.fg = white
c.colors.completion.item.selected.border.bottom = darkgrey
c.colors.completion.item.selected.border.top = darkgrey
c.colors.completion.item.selected.bg = cyan
c.colors.completion.item.selected.fg = darkgrey
c.colors.completion.item.selected.match.fg = magenta
c.colors.completion.match.fg = magenta

c.completion.scrollbar.width = 0

c.colors.contextmenu.menu.bg =  darkgrey
c.colors.contextmenu.menu.fg =  white
c.colors.contextmenu.disabled.bg = darkgrey
c.colors.contextmenu.disabled.fg = midgrey
c.colors.contextmenu.selected.bg = cyan
c.colors.contextmenu.selected.fg = darkgrey

c.colors.hints.bg = yellow
c.colors.hints.fg =  darkgrey
c.colors.hints.match.fg = red

c.colors.tabs.bar.bg = darkgrey
c.colors.tabs.even.bg = darkgrey
c.colors.tabs.odd.bg = darkgrey
c.colors.tabs.selected.even.fg = magenta
c.colors.tabs.selected.odd.fg = magenta
c.colors.tabs.selected.even.bg = lessdarkgrey
c.colors.tabs.selected.odd.bg = lessdarkgrey

c.content.cache.size = 0
