#!/bin/sh
pathmunge () {
	if ! echo "$PATH" | /bin/grep -Eq "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH="$PATH:$1"
           else
              PATH="$1:$PATH"
           fi
        fi
}
pathmunge /home/${USER}/miniconda/bin
source /home/${USER}/miniconda/bin/activate
