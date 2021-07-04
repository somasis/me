# Always restore open sites when qutebrowser is reopened.
# Equivalent of Firefox's "Restore previous session" setting.
c.auto_save.session = True

# Load a restored tab as soon as it takes focus.
c.session.lazy_restore = True

# Unlimited tab focus switching history.
c.tabs.focus_stack_size = -1

# Close when the last tab is closed.
c.tabs.last_close = 'close'

# Open a blank page when :open is given with no arguments.
c.url.default_page = 'about:blank'
c.url.start_pages = c.url.default_page

# I seem to have better performance with process-per-site rather than process-per-site-instance...
c.qt.process_model = "process-per-site"
