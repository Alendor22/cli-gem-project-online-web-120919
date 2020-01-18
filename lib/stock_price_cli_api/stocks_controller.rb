require 'tty-prompt'
require_relative 'user'

class StocksController


  def initialize
    @prompt = TTY::Prompt.new
  end

  def login
    puts "Welcome to the Lendor firm online stock search Portal."
    @prompt.select "Are you a returning user?" do |menu|
      menu.choice "Yes", -> do
      name = @prompt.ask("Please enter your name:")
      @name = User.find_by_name(name)
      sleep(2)
        
      if @name.nil?
      puts "Sorry, I we cannot find a client with that name."
      @prompt.select "What would you like to do?" do |m|
        m.choice "Try Again", -> { login }
        m.choice "Create Account", -> { new_client }
        m.choice "Exit the system", -> {  exit_method  }
        end
      end
    end
      menu.choice "No: (Create new client portal)", -> { new_client }
      menu.choice "Exit the system", -> { exit_method }
    end
    stock_input
  end

  def stocks_system
    puts `clear`
    @prompt.select("Please Select an Option") do |menu|
      menu.choice "Find the highest stock price.", -> { find_highest_stock_price }
      menu.choice "Find the largest change in price in USD.", -> { biggest_change_in_price }
      menu.choice "Stocks listed on an exchange.", -> { listed_exchange }
      menu.choice "Display the highest stock price on a particular exchange.", -> { highest_price_on_exchange }
      menu.choice "Go back", -> { validation_message }
      menu.choice "Exit the system", -> { exit_method }
    end
  end

  def stock_input 
    stock_input = @prompt.ask("Please enter a symbol:")
    @prompt.select("Please select an option." ) do |menu|
    menu.choice "Please re-enter your stock symbol for validation.", -> { stock_exists }
    menu.choice "Search for stock quote.", -> { stock_search }
    menu.choice "Go back", -> { stocks_system }
    menu.choice "Exit the system", -> { exit_method }
    end
  end

  def validation_message
    puts StockList.new.stock_exists(stock_input) ? "Your selection is valid." : "Sorry, we could not validate or find your selection.  Please try again"
    @prompt.select("Please Select an Option") do |menu|
      menu.choice "Search for stock quote.", -> { stock_search }
      menu.choice "Please re-enter your stock symbol for validation.", -> { stock_exists }
      menu.choice "Go back", -> { stocks_system }
      menu.choice "Exit the system", -> { exit_method }
    end
  end

  def exit_method
    exit
  end



end