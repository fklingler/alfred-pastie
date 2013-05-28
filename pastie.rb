#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem
require 'bundle/bundler/setup'

require 'pastie-api'

clipboard = `pbpaste`
language = ARGV.shift
pastie = Pastie.create(clipboard, true, language)

puts pastie.link
