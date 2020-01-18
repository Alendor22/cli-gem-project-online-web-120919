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
    self.all.max { |a, b| a.latestPrice <=> b.latestPrice }
  end

  def self.biggest_change_in_price
    self.all.max { |a, b| a.change <=> b.change }
  end

  def self.listed_exchange(exchange)
    self.all.select { |stock| stock.primaryExchange == exchange }
  end

  def highest_price_on_exchange(exchange)
    find_highest_stock_price.listed_exchange(exchange).sort { |a, b| a.stock <=> b.stock }
    # binding.pry
    # puts "hello world!"
  end



end


# binding.pry
# puts "hello world!"
#highest_price_on_exchange("nasdaq")


