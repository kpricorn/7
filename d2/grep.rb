#!/usr/bin/env ruby

require 'optparse'
require 'colorize'

options = {}

optparse = OptionParser.new do|opts|
  # Set a banner, displayed at the top
  # of the help screen.
  opts.banner = "Usage: grep.rb [options] file1 file2 ..."

  # Define the options, and what they do
  options[:verbose] = false
  opts.on( '-v', '--verbose', 'Output more information' ) do
    options[:verbose] = true
  end

  options[:number] = nil
  opts.on( '-n', '--line-number', 'print line number with output lines' ) do
    options[:number] = true
  end

  options[:color] = nil
  opts.on( '-c', '--color', 'use markers to distinguish the matching string' ) do
    options[:color] = true
  end

  # This displays the help screen, all programs are
  # assumed to have this option.
  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
end

optparse.parse!

pattern = ARGV.shift
st = "\033[7m"
en = "\033[m"

multifile = ARGV.size > 1
ARGV.each do|f|
  File.open(f, 'r') do |file|
    file.each_line.with_index do |line, n|
    re = Regexp.new(pattern)
    mo = line.match(re)
    if mo then
        print "#{f}: " if multifile
        print "#{n} " if options[:number]
        if options[:color] then
          print "#{mo.size} matches / "
          print "#{mo.begin(0)} / #{mo.end(0)}"
          line.gsub(re,"#{st}\\&#{en}")
        else
          puts line
        end
      end
   end
  end
end
