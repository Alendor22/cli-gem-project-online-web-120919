class StocksController

  def initialize
    @prompt = TTY::Prompt.new
  end

  def Search_for_stock 
    stock_symbol =  @prompt.ask("Please enter the stock stmbol you'd like to look up:")
    stocks_system 
  end



end