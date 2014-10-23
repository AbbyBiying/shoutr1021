class PictureShout < ActiveRecord::Base
  has_one :shout, as: :content
end