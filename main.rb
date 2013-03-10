#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'

require 'gtk2'

$app_path = File.expand_path( File.dirname(__FILE__) )
# require_all Dir.glob( $app_path + "/bin/**/*.rb" )

require $app_path + "/core/Core.rb"

Dir[$app_path + "/lib/**/*.rb"].each do |file|
  require file
end

app = App.new
app.start