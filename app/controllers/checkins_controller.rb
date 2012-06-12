class CheckinsController < ApplicationController

  def index
    user_client = Foursquare::User.new(cookies[:access_token])
    response = user_client.checkins("self", :afterTimestamp => 0, :beforeTimestamp => Time.now.to_i)

    checkins_from_foursquare = response['response']['checkins']['items']
    checkins_from_foursquare = checkins_from_foursquare.sort{|x,y| y['createdAt'] <=> x['createdAt']}

    @checkins = checkins_from_foursquare.map do |place|
debugger
      checkin_name = place['venue']['name']
      {:checkin_name => checkin_name, :tags => Tag.show_all_tags_for_checkin(checkin_name)}
    end
  end
end