class CheckinsController < ApplicationController

  def index
    get_checkins
  end

  def map
    get_checkins
  end

private

  def get_checkins
    user_client = Foursquare::User.new(cookies[:access_token])
    response = user_client.checkins("self", :afterTimestamp => 0, :beforeTimestamp => Time.now.to_i)

    checkins_from_foursquare = response['response']['checkins']['items']
    checkins_from_foursquare = checkins_from_foursquare.sort{|x,y| y['createdAt'] <=> x['createdAt']}

    @checkins = checkins_from_foursquare.map do |place|
      checkin_name = place['venue']['name']
      {
        :checkin_name => checkin_name,
        :tags => Tag.show_all_tags_for_checkin(checkin_name),
        :lat => place['venue']['location']['lat'],
        :lng => place['venue']['location']['lng']
      }

    end
  end
end

