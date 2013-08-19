class AddFirstLastProfilePic < ActiveRecord::Migration
  def up
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :profile_pic_url, :string
  end

  def down
  end
end
