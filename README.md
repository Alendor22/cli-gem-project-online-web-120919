# StockPriceCliApi

Overview

My project connects to the www.IEXcloud.io API with the Rest-Client gem, I then parse stock data with the use of the JSON gem.  When I pass in a stock as an argument to the IEXcloud.io API, I receive a response in the form of an array of hashes.  I then take my response hash and obtain the attributes of the stock quote requested through the use of mass assignment and reject any attributes that are not specified by the attribute accessor.  A user of the stock price cli api Data gem can sign in, all prompts and inputs from those prompts are handled by the TTY-Prompt gem.  Once signed in, a new user is instantiated.  The user will then be prompted to enter a stock which will be validated from a stock list array of arrays with that contains all the stocks currently traded on all American exchanges.  A list with over 6900 currently traded stocks.  After a stock is chosen a new stock object is instantiated via the Stocks class.  To view the stock instantiated a StocksImporter object is created.  I pass the instantiated Stock object as arguments to the methods created to pull certain details from those objects.  Those methods include collecting the selection of stocks objects that have been searched as well as the seeded stock objects returning a list of all the stock objects instantiated.  Two methods that find the highest and lowest price among the seeded data set stock objects.  As well as a method that compares all the stocks in the data set and returns the one with the biggest change in price.  A user can also exit the application only through the selection of exit.

## Installation

gem 'stock_price_cli_api'
gem 'dotenv'
gem 'rest-client'
gem 'json'
gem 'tty-prompt'
gem 'pry'
gem 'require_all'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stock_price_cli_api

## Usage

Step 1: Clone the following repo https://github.com/alendor22/stock_price_cli_api then cd in to the cli-data-gem-project-online-web-ft-120919 directory then cd into the stock_price_cli_api folder.
Step 2: To run this application just type ./bin/run from the stock_price_cli_api folder witch is in the cli-data-gem-project-online-web-ft-120919 directory which was step 1.
Step 3: Follow the on screen prompts to login and then search for details about your selected stock, view all the stocks in the data set, find the highest and lowest price among all the stocks in the data set, as well as find the biggest change in price among the stocks in the data set.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alendor22/stock_price_cli_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.  “Data provided by IEX Cloud” https://iexcloud.io, attribution for all live quotes <a href="https://iexcloud.io">IEX Cloud</a>.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the StockPriceCliApi project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/alendor22/stock_price_cli_api/blob/master/CODE_OF_CONDUCT.md).
