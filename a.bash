#!/bin/sh

NAMES=""
NAMES="${NAMES} MYNAME"
NAMES="${NAMES} YOURNAME"
NAMES="${NAMES} THEIRNAME"

echo 'One at a time...'
for NAME in ${NAMES}; do
    echo ${NAME};
done

echo 'All together now!'
echo ${NAMES}
