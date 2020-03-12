require_relative "./movieshowtimes/version"
require_relative "./movieshowtimes/showtimes"
require_relative "./movieshowtimes/theatre"
require_relative "./movieshowtimes/cli"
require_relative "./movieshowtimes/api"
require "pry"
require 'httparty'
require 'colorize'

module Movieshowtimes
  class Error < StandardError; end
  # Your code goes here...
end
