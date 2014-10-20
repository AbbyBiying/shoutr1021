class AddUserIdToShouts < ActiveRecord::Migration
  def change
    add_column :shouts, :user_id, :integer
    add_column :shouts, :content, :text
  end
end
