class User < ActiveRecord::Base
  has_many :shouts
  

  has_many :follow_relationships, foreign_key: :follower_id, 
    class_name: "FollowRelationship"
    
  has_many :followed_users, through: :follow_relationships


  has_many :followered_relationships, foreign_key: :followed_user_id, 
    class_name: "FollowRelationship"

  has_many :followers, through: :followered_relationships
 

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true


  def follow(user)
    followed_users << user
  end
  
  def to_param
    username
  end
end
