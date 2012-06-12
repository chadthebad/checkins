class AddTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.string :checkin_name
      t.timestamps
    end
  end
end
