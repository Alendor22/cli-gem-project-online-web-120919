require 'dotenv/load'
require 'rest-client'
require 'json'
require 'pry'
require 'csv'
require_relative 'stocks'
#require_relative '../db/stock_list.csv'


class StocksImporter

  BASE_URL = "https://cloud.iexapis.com/stable/"

  def stock_search(symbol)
    response = RestClient.get(BASE_URL+"stock/#{symbol}/quote/", {params: {token: ENV["API_TOKEN"]}})
    quote_hash = JSON.parse(response.body)
    stock_data = Stocks.new(quote_hash)
  end

  #CSV.read("stock_list.csv").parse

end
#binding.pry