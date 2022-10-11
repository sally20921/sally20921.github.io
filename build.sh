#!/bin/zsh

brew install libxml2 libxslt
bundle config path 'vendor/bundle' --local
bundle config build.nokogiri --use-system-libraries=true --with-xml2-include="$(xcrun --show-sdk-path)"/usr/include/libxml2
bundle install
bundle exec jekyll serve
