class Tag < ActiveRecord::Base
  attr_accessible :checkin_name, :tag_name

  def self.show_all_tags_for_checkin(checkin_name)
    Tag.find_all_by_checkin_name(checkin_name).map(&:tag_name).join(", ")
  end

end