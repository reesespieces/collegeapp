require 'rubygems'
require 'bundler'
Bundler.require

require './app.rb'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://db/main.db')
require "./models/college.rb"

run Search