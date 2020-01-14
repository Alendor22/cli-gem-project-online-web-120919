class Stocks

  attr_accessor :symbol, :companyName, :primaryExchange, :latestPrice, :latestTime, :change, :week52High, :week52Low

  @@all = []

  def initialize(attributes)
    attributes.each { |key, value| self.send (("#{key}="), value) }
    @@all << self 
  end

  def self.all 
    @@all
  end



end