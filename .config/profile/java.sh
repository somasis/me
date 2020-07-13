#!/bin/sh
# java - Set environment variables for Java applications

# Fix issues with Java+tiling window managers
export _JAVA_AWT_WM_NONREPARENTING=1

# Make Java use GTK styling
_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dsun.java2d.dpiaware=true'

# Use XDG directory structure
_JAVA_OPTIONS="${_JAVA_OPTIONS} -Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"

export _JAVA_OPTIONS

