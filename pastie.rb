#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems' unless defined? Gem
require File.join(File.dirname(__FILE__), 'bundle/bundler/setup')

require 'optparse'
require 'pastie-api'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: pastie.rb -r [options]"
  opts.on("-r", "--raw", "Get the raw link") do |r|
    options[:raw] = r
  end
end.parse!

clipboard = `pbpaste`
language = ARGV.shift
pastie = Pastie.create(clipboard, true, language)

if options[:raw]
  puts pastie.raw_link
else
  puts pastie.link
end
