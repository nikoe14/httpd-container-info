#!/bin/bash
IP=$(ifconfig | grep -A 1 'eth0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1)
sed -e 's/IP_CONTAINER/'"$IP"'/g' /tmp/template-index.html > /tmp/template2-index.html
sed -e 's/HOSTNAME_CONTAINER/'"$HOSTNAME"'/g' /tmp/template2-index.html > /usr/local/apache2/htdocs/index.html
httpd -D FOREGROUND
exec "$@"