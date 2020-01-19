require 'tty-prompt'
require_relative 'user'

class StocksController

  def initialize
    @prompt = TTY::Prompt.new
  end

  def login
    puts "Welcome to the Lendor Firms online stock search Portal."
    @prompt.select "Are you a returning user?" do |menu|
      menu.choice "Yes", -> do
      @name = @prompt.ask("Please enter your name:")
      @name = User.find_by_name(@name)
      sleep(2)
        
      if @name.nil?
      puts "Sorry, I we cannot find a client with that name."
      @prompt.select "What would you like to do?" do |menu|
        menu.choice "Try Again", -> { login }
        menu.choice "Create Account", -> do @name = @prompt.ask("Please enter your name:") 
        puts { User.new.new_client(@name) }
        end
        menu.choice "Exit the system", -> { exit_method }
        end
      end
    end
      menu.choice "No: (Create new client portal)", -> do @name = @prompt.ask("Please enter your name:")
      puts { User.new.new_client(@name) }
      end
      menu.choice "Exit the system", -> { exit_method }
    end
    stock_input
  end

  def stock_input 
    @symbol_input = @prompt.ask("Please enter a symbol:")
    puts StockList.new.stock_exists(@symbol_input) ? "Your selection is valid." : "Sorry, we could not validate or find your selection. Please try again"
    sleep(2)
    @prompt.select("Please select an option below:") do |menu|
      menu.choice "Search for stock quote.", -> do puts "Company: #{StocksImporter.new.stock_search(@symbol_input).companyName}"
      puts "Syymbol: #{StocksImporter.new.stock_search(@symbol_input).symbol}"
      puts "Current trading price: #{StocksImporter.new.stock_search(@symbol_input).latestPrice}" 
      puts "Previous closing price: #{StocksImporter.new.stock_search(@symbol_input).previousClose}" 
      puts "Exchange traded on: #{StocksImporter.new.stock_search(@symbol_input).primaryExchange}" 
      puts "Time of last trade: #{StocksImporter.new.stock_search(@symbol_input).latestTime}"
      puts "Change amount: #{StocksImporter.new.stock_search(@symbol_input).change}"
      puts "52 week high price: #{StocksImporter.new.stock_search(@symbol_input).week52High}"
      puts "52 week low price: #{StocksImporter.new.stock_search(@symbol_input).week52Low}"
      end
      menu.choice "Please re-enter your stock symbol for validation.", -> { stock_input }
      menu.choice "Go to stock system menu.", -> { stocks_system }
      menu.choice "Exit the system", -> { exit_method }
    end
    sleep(1)
    stocks_system
  end
  
  def stocks_system
    @prompt.select("Please Select an Option below:") do |menu|
      menu.choice "List all companies in data set.", -> { puts "#{Stocks.all_companies}" }
      menu.choice "Find the lowest stock price among data set.", -> { puts "#{Stocks.find_lowest_stock_price.latestPrice}" }
      sleep(2)
      menu.choice "Find the highest stock price among data set.", -> { puts "#{Stocks.find_highest_stock_price.latestPrice}" }
      menu.choice "Find the largest change in price in USD.", -> { puts "#{Stocks.biggest_change_in_price.change}" }
      menu.choice "Go back to the stock validation menu.", -> { stock_input }
      menu.choice "Exit the system", -> { exit_method }
    end
    stocks_system
  end

  def exit_method
    exit
  end

end