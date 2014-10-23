class Shout < ActiveRecord::Base
   
  
  belongs_to :user
  
  belongs_to :content, polymorphic: true 

  validates :content, presence: true

  def self.text_shouts(ids)
    where(content_type: "TextShout", content_id: ids)
  end 

  
  def username
    user.username
  end
end
