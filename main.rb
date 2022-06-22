require_relative './app'
require './data'
require 'json'

puts 'Hey! Welcome to your app!'
initialize_files

def main
  app = App.new
  app.start
end
main
