#!/bin/bash

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#145ba730'  # default
T='#ee00eeee'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying

i3lock -i ~/.i3/lock.png \
--insidevercolor=$C   \
--ringvercolor='#00000050'     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--keyhlcolor='#145ba7ff' \
--insidecolor='#145ba760' \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--textcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
\
--veriftext="" \
--wrongtext="" \
--textsize=20 \
--modsize=10 \
