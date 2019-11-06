class WelcomeController < ApplicationController
  def index
  	@footwears = Footwear.all.count
  	@providers = Provider.all.count
  	@clients = Client.all.count
  end
end
