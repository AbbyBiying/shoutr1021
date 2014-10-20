class CreateShouts < ActiveRecord::Migration
  def change
    create_table :shouts do |t|

      t.timestamps
    end
  end
end
