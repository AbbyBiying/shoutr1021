class User < ActiveRecord::Base
  has_many :shouts
  
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  has_many :followed_user_relationships,
    class_name: "FollowRelationship",
    foreign_key: :follower_id

  has_many :followed_users, through: :followed_user_relationships

  def follow(user)
    followed_users << user
  end
  
  def to_param
    username
  end
end
