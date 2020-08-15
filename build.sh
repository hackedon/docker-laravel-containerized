#!/bin/bash +x
if [[ "$(docker images -q base_php_7.4_cli_alpine:latest 2>/dev/null)" == "" ]]; then
  echo "Building base_php_7.4_cli_alpine:latest"
  docker build ./base-php-7.4-cli-alpine -t base_php_7.4_cli_alpine
fi

docker-compose up --build mysql redis php-1 php-2 horizon-worker pusher nginx
