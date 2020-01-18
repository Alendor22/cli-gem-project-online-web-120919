require 'pry'
require_relative 'stocks_controller'

class User

  attr_accessor :name 

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all 
    @@all
  end

  def self.find_by_name(name)
    self.all.find { |user| user.name == name}
  end

  def new_client(name)
    name = gets.chomp.strip
    self.new(name)
  end

end