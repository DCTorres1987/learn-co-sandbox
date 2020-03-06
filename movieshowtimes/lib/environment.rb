require_relative "./movieshowtimes/version"
require_relative "./movieshowtimes/cli"
require_relative "./movieshowtimes/api"
require "pry"
require 'httparty'

module Movieshowtimes
  class Error < StandardError; end
  # Your code goes here...
end
