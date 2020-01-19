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
  
  def self.all_companies
    self.all.map { |stock| stock.companyName }.uniq
  end
  
  def self.find_lowest_stock_price
    self.all.min { |a, b| a.latestPrice[:"companyName"] <=> b.latestPrice[:"companyName"] }
  end

  def self.find_highest_stock_price
    self.all.max { |a, b| a.latestPrice <=> b.latestPrice }
  end

  def self.biggest_change_in_price
    self.all.max { |a, b| a.change <=> b.change }
  end

end
