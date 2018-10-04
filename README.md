# scripts

scripts that I use often, programs big or useful enough to warrant sharing but not big enough to
need a repository.

## OldNotifier

OldNotifier is a shell script (requires bash) that uses [The Old Reader](theoldreader.com)'s API to
show notifications every so often about how many unread articles you have, and how many articles in
a label/folder you have unread.

I don't really maintain it anymore but you're welcome to use it.

### Prerequisites

- [The Old Reader](theoldreader.com) account
- `notify-send` (from libnotify)
- `curl` or `wget`

### Configuration

Configuration can be set in `$XDG_CONFIG_HOME/oldnotifier.conf`.

#### Configuration variables

- `email` - The email you used to register with The Old Reader; ex. `rssaddict@gitlab.com`
- `password` - Password used to login to The Old Reader; ex. `hunter2`
- `notify_every` - How often to notify you; ex. `30m`, which would notify you of unread articles
every thirty minutes.
- `wait_until_top_of_hour` - If you want to wait until the top of the hour to start notifying; ex.
`false`
- `retrieve_preference` - What program you'd like to use for retrieving the data; ex. `wget` (curl
and wget are the only valid options)
- `protocol` - What protocol to use for getting it; ex. `https` (http and https are the only valid
options. Please use https.)
- `icon` - What icon to use for the notifications. You can use a file location or a system icon
name here; ex. `internet-feed-reader`

## License

This is free and unencumbered software released into the public domain. Read the [UNLICENSE] for
the full details.
