class BitcoinsController < ApplicationController

  def index
    @bitcoin = params["amount"].to_f
    require "net/http"
    require "json"
    url = "https://blockchain.info/ticker"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    bitcoin_data = JSON.parse(response)

    @usd_rate = bitcoin_data["USD"]["last"]
    @usd_value = @usd_rate * @bitcoin
    # add backend code
    # render bitcoins/index view
  end

end