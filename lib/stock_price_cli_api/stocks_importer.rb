require 'pry'

class StocksImporter

  BASE_URL = "https://cloud.iexapis.com/stable/"

  def initialize
    response = RestClient.get("#{BASE_URL}/", {params: "API_TOKEN"})
    response_hash = JSON.parse(response.body)
    

  end
  #binding.pry
  puts "hello world"


end