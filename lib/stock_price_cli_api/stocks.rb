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



end