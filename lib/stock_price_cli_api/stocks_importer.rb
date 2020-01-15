require 'dotenv/load'
require 'rest-client'
require 'json'
require 'pry'
require_relative 'stocks'


class StocksImporter

  BASE_URL = "https://cloud.iexapis.com/stable/"

  # attr_accessor :symbol

  # def initialize(attributes)
  #   attributes.each { |key, value| self.send(("#{key}="), value)}
  # end

  
  def stock_search(symbol)
    response = RestClient.get(BASE_URL+"stock/#{symbol}/quote/", {params: {token: ENV["API_TOKEN"]}})
    
    response_hash = JSON.parse(response.body)
    Stocks.new(response_hash)
    binding.pry
  end

  
  
  
end
StocksImporter.new.stock_search("aapl")
#binding.pry
puts "hello world"