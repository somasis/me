import subprocess

def read_xresources(prefix):
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props

xresources = read_xresources("*")

# Downloads bar.
c.downloads.position = "bottom"
c.colors.downloads.start.bg = xresources["*background"]
c.colors.downloads.stop.bg = xresources["*color2"]
c.colors.downloads.error.bg = xresources["*color1"]
c.colors.downloads.bar.bg = xresources["*background"]

# Statusbar.
c.statusbar.position = "top"
c.statusbar.padding = {"bottom": 8, "left": 4, "right": 8, "top": 8}
c.completion.open_categories = ["quickmarks", "searchengines", "bookmarks", "history", "filesystem"]

c.colors.statusbar.command.bg = xresources["*background"]
c.colors.statusbar.command.fg = xresources["*foreground"]
c.colors.statusbar.insert.bg = xresources["*color2"]
c.colors.statusbar.insert.fg = xresources["*foreground"]
c.colors.statusbar.normal.bg = xresources["*background"]
c.colors.statusbar.normal.fg = xresources["*foreground"]
c.colors.statusbar.passthrough.bg = xresources["*color4"]
c.colors.statusbar.passthrough.fg = xresources["*foreground"]
c.colors.statusbar.private.bg = xresources["*color5"]
c.colors.statusbar.private.fg = xresources["*foreground"]
c.colors.statusbar.progress.bg = xresources["*color2"]
c.colors.statusbar.url.error.fg = xresources["*color9"]
c.colors.statusbar.url.fg = xresources["*color4"]
c.colors.statusbar.url.hover.fg = xresources["*color4"]
c.colors.statusbar.url.success.http.fg = xresources["*color4"]
c.colors.statusbar.url.success.https.fg = xresources["*color4"]
c.colors.statusbar.url.warn.fg = xresources["*color3"]

# Completion.

c.colors.completion.category.bg = xresources["*colorAccent"]
c.colors.completion.category.border.bottom = xresources["*colorAccent"]
c.colors.completion.category.border.top = xresources["*colorAccent"]
c.colors.completion.even.bg = xresources["*foreground"]
c.colors.completion.fg = xresources["*background"]
c.colors.completion.item.selected.bg = xresources["*colorAccent"]
c.colors.completion.item.selected.border.bottom = xresources["*colorAccent"]
c.colors.completion.item.selected.border.top = xresources["*colorAccent"]
c.colors.completion.item.selected.fg = xresources["*foreground"]
c.colors.completion.item.selected.match.fg = xresources["*foreground"]
c.colors.completion.odd.bg = xresources["*foreground"]

# Tabs.
c.tabs.position = "left"
c.tabs.padding = {"bottom": 8, "left": 8, "right": 0, "top": 8}

c.tabs.title.format = "{perc}{audio}{current_title}"
c.tabs.title.format_pinned = "{perc}{current_title}"

c.tabs.favicons.scale = 1.25
c.tabs.indicator.width = 0
c.tabs.width = "20%"
c.tabs.close_mouse_button = "right"
c.tabs.select_on_remove = "next"

# Colors (themed like Arc-Darker).
c.colors.tabs.bar.bg = "#ededee"
c.colors.tabs.odd.bg = "#f5f6f7"
c.colors.tabs.even.bg = "#f5f6f7"

c.colors.tabs.even.fg = xresources["*background"]
c.colors.tabs.odd.fg = xresources["*background"]
c.colors.tabs.pinned.even.bg = xresources["*background"]
c.colors.tabs.pinned.odd.bg = xresources["*background"]
c.colors.tabs.pinned.selected.even.bg = xresources["*colorAccent"]
c.colors.tabs.pinned.selected.odd.bg = xresources["*colorAccent"]
c.colors.tabs.selected.even.bg = xresources["*colorAccent"]
c.colors.tabs.selected.even.fg = xresources["*foreground"]
c.colors.tabs.selected.odd.bg = xresources["*colorAccent"]
c.colors.tabs.selected.odd.fg = xresources["*foreground"]

# Window.
c.window.title_format = "qutebrowser{title_sep}{current_title}"

# Messages.
c.messages.timeout = 5000

# Interacting with page elements.
c.input.insert_mode.auto_enter = False
c.input.insert_mode.auto_leave = False
c.input.insert_mode.leave_on_load = False
