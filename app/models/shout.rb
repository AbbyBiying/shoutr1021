class Shout < ActiveRecord::Base
  belongs_to :user
  #, index: true, null: false
  validates :content, presence: true
  
  def username
    user.username
  end
end
