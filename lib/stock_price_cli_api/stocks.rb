require 'dotenv/load'
require 'rest-client'
require 'json'
require 'pry'
require_relative 'stocks_importer'

class Stocks

  attr_accessor :companyName, :symbol, :latestPrice, :previousClose, :primaryExchange, :latestTime, :change, :week52High, :week52Low

  @@all = []

  def initialize(attributes)
    attributes.each { |key, value| self.send(("#{key}="), value) if self.respond_to?("#{key}=")}
    self.save
  end

  def self.all 
    @@all
  end

  def save
    @@all << self
  end

  def self.find_highest_stock_price
    Stocks.all.max { |a, b| a.latestPrice <=> b.latestPrice }
  end
  


    # company_name = stock_quote_data[companyName]
    # symbol = stock_quote_data[symbol]
    # current_price = stock_quote_data[latestPrice]
    # previous_close_price = stock_quote_data[previousClose]
    # change_in_price = stock_quote_data[change]

end


