#!/bin/bash

# Simple script to run Jekyll in Docker
docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  --publish 4000:4000 \
  jekyll/jekyll:pages \
  jekyll serve --watch --force_polling --verbose