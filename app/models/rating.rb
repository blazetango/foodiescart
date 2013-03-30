class Rating < ActiveRecord::Base
  attr_accessible :recipe_id, :value ,:user_id
  belongs_to :recipe
  validates :recipe_id, :uniqueness => {:scope => :user_id,
    :message => "should only once " }
end
