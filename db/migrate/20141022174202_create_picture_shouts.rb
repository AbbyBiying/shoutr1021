class CreatePictureShouts < ActiveRecord::Migration
  def change
    create_table :picture_shouts do |t|
      t.string :url

      t.timestamps
    end
  end
end
