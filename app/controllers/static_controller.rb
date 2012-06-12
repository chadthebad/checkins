class StaticController < ApplicationController
  def index
  end

  def map
  end

  def list
    user_client = Foursquare::User.new(cookies[:access_token])
    response = user_client.checkins("self", :afterTimestamp => 0, :beforeTimestamp => Time.now.to_i)
    @checkins = response['response']['checkins']['items']
  end
  
  def callback
    # binding.pry
    if params[:access_token]
      cookies[:access_token] = params[:access_token]
      redirect_to "/static/list"
    end
  end
  
  def login
    oauth_key = 'IRIE03VZLAYMIWULBU1AVPT4NIXG5OHBZDUSCMMBQUY4CWCP'
    oauth_secret = '2FPPVS0ZMPYV5ENKZEV31BSXGACNPYV1VLLJKYL4Q0JDLH4Z'

    redirect_url = "http://localhost:3000/callback"

    @foursquare_auth_url = "https://foursquare.com/oauth2/authenticate?client_id=#{oauth_key}&response_type=token&redirect_uri=#{redirect_url}"
    redirect_to @foursquare_auth_url
  end
end
