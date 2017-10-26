#!/bin/bash

set -e

IP=$(hostname -I)

if [ -n "$GPLCART_INSTALL" ]; then
  php gplcart install-fast --user-email="$GPLCART_EMAIL" --user-password="$GPLCART_PASSWORD" --db-name="$MYSQL_DATABASE" --db-user="root" --db-password="$MYSQL_ROOT_PASSWORD" --db-host="$IP" --store-host="$IP"
fi

exec "$@"