# Scripts
scripts that I use often, programs big or useful enough to warrant sharing but not big enough to need a repository

## Common properties of the scripts
If a script has configuration, it is probably read from `$XDG_CONFIG_HOME`.

This is normally a folder named `.config` in your home directory. If `$XDG_CONFIG_HOME` is not defined, it will default to `$HOME/.config`.

## OldNotifier
OldNotifier is a shell script (requires bash) that uses [The Old Reader](theoldreader.com)'s API to show notifications every so often about how many unread articles you have, and how many articles in a label/folder you have unread.

### Prerequisites
- [The Old Reader](theoldreader.com) account
- notify-send (from libnotify, libnotify-bin, or notify-osd)
- curl or wget

### Configuration
Configuration can be set in `$XDG_CONFIG_HOME/oldnotifier.conf`.

#### Configuration variables
- `email` - The email you used to register with The Old Reader; ex. `rssaddict@github.com`
- `password` - Password used to login to The Old Reader; ex. `hunter2`
- `notify_every` - How often to notify you; ex. `30m`, which would notify you of unread articles every thirty minutes.
- `wait_until_top_of_hour` - If you want to wait until the top of the hour to start notifying; ex. `false`
- `retrieve_preference` - What program you'd like to use for retrieving the data; ex. `wget` (curl and wget are the only valid options)
- `protocol` - What protocol to use for getting it; ex. `https` (http and https are the only valid options. Please use https.)
- `icon` - What icon to use for the notifications. You can use a file location or a system icon name here; ex. `internet-feed-reader`


## rc
`rc` is a script that just provides a command for easy interaction with your init system. Currently only SysV-style, systemd, and Upstart are supported.

If you want to control a remote host, you can specify it with `rc -h` or `rc --host=ssh-enabled-host.com`.

### Prerequisites
- An `init` system
- `ssh`, if you want to use the remote host feature

### Configuration
Configuration can be set in `$XDG_CONFIG_HOME/rc.conf`.

#### Configuration variables
- `excluded_daemons` - An array of daemons to exclude from the rc listing; ex. `excluded_daemons=( "systemd-.*" "user@.*" "getty@.*" )`

## mpd-alarm
`mpd-alarm` sets up [Music Player Daemon](http://musicpd.org) to be used as an alarm clock.

### Prerequisites
- [Music Player Daemon](http://musicpd.org)
- `mpc`
- A sound system; PulseAudio, ALSA, or OSS are current supported (you probably already have one)

### Configuration
Configuration is found in `$XDG_CONFIG_HOME/mpd-alarm.conf`.

#### Configuration variables
- `MPD_HOST` - Host that MPD is running on; ex. `localhost`
- `MPD_PORT` - Port that MPD is running on. Use a port number or a path to a Unix socket; ex. `6600`
- `use_repeat` - Whether or not to put MPD into repeat mode once the alarm is running; ex. `true`
- `use_playlist` - Whether to use a playlist for the alarm, or use the entire library and shuffle it; ex. `true`
- `alarm_playlist` - Name of the playlist used for alarm music; ex. `Alarm`
- `previous_playlist` - Where to save the MPD playlist before the alarm went off to; ex. `Previous`
- `sound_system` - Sound system that you use. This can be alsa, oss, or pulseaudio. When in doubt, choose alsa; ex. `pulseaudio`
- `pulse_output`, `alsa_channel`, `oss_output` - Name of output that will have the volume changed when the alarm goes off

## mpd-on-same-album
`mpd-on-same-album` sets the Replaygain value and crossfade value based on what track is next.

If a track from the same album that the currently playing one is from is next, it will turn off crossfade, and set Replaygain to album mode. If it is not, crossfade will be turned on, and Replaygain set to track mode.

This feature is emulated based on it's implementation in music players such as Clementine.

### Prerequisites
- [Music Player Daemon](http://musicpd.org)
- `mpc`

### Configuration
Configuration is found in `$XDG_CONFIG_HOME/mpd-on-same-album.conf`.

## Configuration variables
- `MPD_HOST` - Host that MPD is running on; ex. `localhost`
- `MPD_PORT` - Port that MPD is running on. Use a port number or a path to a Unix socket; ex. `6600`
- `set_replaygain` - If you want Replaygain to be set based on the next track; ex. `true`
- `preferred_crossfade` - Length that crossfade should be set to when next track is not from current album; ex. `2`, for two second crossfade.
- `sleep_amount` - Amount to sleep in between checking currently playing track; ex. `2s` for two seconds.

## toggle-touchpad
`toggle-touchpad` just attempts to toggle the first touchpad it finds on your system, using xinput. Xinput is used instead of, say, Synclient because synclient does not turn off the buttons on some touchpads. Xinput, does though.

### Prerequisites
- `xinput`

## xfce4-screenshooter-handler
`xfce4-screenshooter-handler` is a wrapper for xfce4-screenshooter. It will simply run xfce4-screenshooter with arguments to open it with the `xfce4-screenshooter-handler` program, which can then operate on the screenshot taken with the `wrap_mode_action()` function.

### Use examples
- Uploading image to a remote server, or sync folder
- Uploading to imgur
- Giving it a specific name
- etc.

### Prerequisites
- `xfce4-screenshooter`

### Configuration
Configuration is set within the script. You need to edit the `wrap_mode_action()` function to do what you want. This can be anything from uploading an image via wget to renaming it, whatever you can write in `bash` script, you can make it do.

## License
These scripts are all licensed under the [0BSD License](LICENSE).
