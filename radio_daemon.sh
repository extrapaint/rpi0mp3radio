#!/bin/sh
# Restarts pifm & mpg123 when run.
# Triggered by pushbutton.py, which watches for the button push, and runs this when pressed.

# Find process IDs (pids) for mpg123 and pifm, and kill the processes.
# **Needs a test to make sure each only runs one process- 
# **Change to use a while loop.
kill -9 `psaux | grep "mpg123" | cut -d " " -f 1`
kill -9 `psaux | grep "pifm" | cut - " " -f 1`
# Start playing
# May need to fork this into a seperate process, since this next line worked in /etc/rc.local for sure...
# Also note, when adding mp3s to the Music directory, the bitrate should be uniform. Very low bitrate songs play 
# like a Chipmunks song.
nice -n -19 /usr/bin/mpg123 -s -r 22050 -Z /home/pi/Music/* | nice -n -19 /home/pi/pifm/pifm - 87.9 22050 stereo
