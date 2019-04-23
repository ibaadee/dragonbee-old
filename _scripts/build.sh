#!/bin/bash
set -x
# Build the site with Jekyll
bundle exec jekyll build production
JEKYLL_ENV=production jekyll build

# Compress assets with Zopfli 
# SKIPPED
#zopfli/zopfli --i1000 _site/**/*.html _site/*.html  _site/**/*.css _site/*.css _site/**/*.js _site/*.js _site/**/*.xml _site/*.xml
