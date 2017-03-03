#!/bin/bash

http_get() {
    exec 3<>/dev/tcp/${1}/${2:-80}
    echo -en "GET ${3:-'/'} HTTP/1.1\nHost: ${1}\nConnection: Close\n\n" >&3
    while read line; do echo -en "$line\n"; done <&3
}

http_post() {
    exec 3<>/dev/tcp/${1}/${2:-80}
    echo -en "POST ${3:-'/'} HTTP/1.1\nHost: ${1}\nConnection: Close\nuser=admin&password=123456\n\n" >&3
    while read line; do echo -en "$line\n"; done <&3
}

