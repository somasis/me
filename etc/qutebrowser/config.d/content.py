# Request websites to minimize non-essential animations and motion.
c.content.prefers_reduced_motion = True

# Don't send any DoNotTrack headers; they're pointless.
c.content.headers.do_not_track = None

# Allow JavaScript to read from or write to the clipboard.
c.content.javascript.can_access_clipboard = True

# Draw the background color and images also when the page is printed.
c.content.print_element_backgrounds = False

# List of user stylesheet filenames to use.
# c.content.user_stylesheets = 'stylesheet.css'

c.content.prefers_reduced_motion = True

# Languages to use for spell checking.
# TODO Add es-MX in hopes it is added someday.
c.spellcheck.languages = ['en-US', 'en-AU', 'en-GB', 'es-ES']

# Allow for more precise zooming increments.
c.zoom.mouse_divider = 2048
