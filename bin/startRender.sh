#!/bin/sh
export REDIS_URL="redis://${REDIS_HOST}:${REDIS_PORT}"
bundle exec puma -C config/puma.rb