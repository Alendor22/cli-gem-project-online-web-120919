require 'rest-client'
require 'json'
require 'rinku'
require 'tty-prompt'
require 'dotenv/load'
require 'pry'
require_relative '.env'

module Concerns
end

require_all 'lib'