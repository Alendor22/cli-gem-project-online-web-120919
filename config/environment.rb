require 'dotenv/load'
require 'rest-client'
require 'json'
require 'rinku'
require 'tty-prompt'
require 'pry'
require 'csv'

module Concerns
end

require_all 'lib'
require_relative 'db/stock_list'