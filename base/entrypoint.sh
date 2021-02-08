#!/bin/bash
set -e
cd "$(dirname "$0")"

sed -i \
    -e 's/!!SERVER_NAME!!/'"$SERVER_NAME"'/g' \
    -e 's/!!SERVER_ID!!/'"$SERVER_ID"'/g' \
    -e 's/!!WHITE_LIST!!/'"$WHITE_LIST"'/g' \
    -e 's/!!ONLINE_MODE!!/'"$ONLINE_MODE"'/g' \
    /app/server.properties

exec java -jar /paper/paper.jar -nogui
