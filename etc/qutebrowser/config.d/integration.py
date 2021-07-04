# Integrate with lunch(1).

# Default program used to open downloads.
c.downloads.open_dispatcher = "lunch"

# Editor (and arguments) to use for the `edit-*` commands.
c.editor.command = ["terminal", "lunch", "-o", "editor", "+{line}:{column}", "{file}"]

# Integrate with pass(1).
# -n: Don't automatically enter into insert mode, so as to match the c.input.insert_mode.* settings.
config.bind("<z><l><l>", "spawn --userscript qute-pass -d 'dmenu -p \"pass[qutebrowser]\"' -n")
config.bind("<z><l><u>", "spawn --userscript qute-pass -d 'dmenu -p \"pass[qutebrowser]\"' -n -e")
config.bind("<z><l><p>", "spawn --userscript qute-pass -d 'dmenu -p \"pass[qutebrowser]\"' -n -w")

# Akin to the browserpass Firefox extension.
config.bind("<Ctrl+Shift+F>", "spawn --userscript qute-pass -d 'dmenu -p \"pass[qutebrowser]\"' -n")

# Integrate with kdeconnect.
config.bind("<z><k><u>", "spawn --userscript kdeconnect {url}")

# Integrate with list-add(1).
config.bind("<z><t><w>", "spawn --userscript todo-add {title} {url} -l wish")

# XDG integration.

# TODO Isn't there some way to get the XDG download directory from ~/etc/user-dirs.dirs?
c.downloads.location.directory = "~/mess/current/incoming"
