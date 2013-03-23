class OriginPlace < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :country

has_many :recipes

end
