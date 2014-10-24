class User < ActiveRecord::Base 
  has_many :shouts
  
  has_many :likes  
  has_many :liked_shouts, through: :likes, source: :shout


  has_many :followed_relationships,
    class_name: "FollowRelationship",
    foreign_key: "follower_id"

  has_many :followed_users, through: :followed_relationships

  has_many :follower_relationships,
    class_name: "FollowRelationship",
    foreign_key: "followed_user_id"

  has_many :followers, through: :follower_relationships


  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def timeline
    Shout.where(user_id: includes_myself).order(created_at: :desc)
  end

  def includes_myself
    [id] + followed_user_ids
  end
  

  def follow(user)
    followed_users << user
  end

  def unfollow(user)
    followed_users.destroy(user)
  end

  def following?(user)
    followed_users.include? user
  end

  def to_param
    username
  end
end
