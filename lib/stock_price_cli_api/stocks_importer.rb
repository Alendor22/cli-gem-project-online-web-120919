require 'dotenv/load'
require 'rest-client'
require 'json'
require 'pry'
require_relative 'stocks'
require_relative 'stock_list'

class StocksImporter

  BASE_URL = "https://cloud.iexapis.com/stable/"

  def stock_search(stock_input)
    response = RestClient.get(BASE_URL+"stock/#{stock_input}/quote/", {params: {token: ENV["API_TOKEN"]}})
    quote_hash = JSON.parse(response.body)
    stock_data = Stocks.new(quote_hash)
  end

end