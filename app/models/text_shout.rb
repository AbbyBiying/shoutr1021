class TextShout < ActiveRecord::Base
  has_one :shout, as: :content

  def self.search(query)
    where("body ILIKE ?", "%#{query}%")
  end
end
