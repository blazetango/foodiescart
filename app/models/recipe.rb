class Recipe < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :tag_list
  paginates_per 2
 attr_accessible :author_name, :category_id, :cooking_time, :difficulty_level, :name, :photo,
                 :preparation_method, :user_id, :ingredient_recipes_attributes, :tag_list,:prep_methods_attributes,
:prep_time,:tips,:servers, :course,:origin_place_name , :tested, :uploads_attributes
 
 has_many :uploads
 belongs_to :origin_place
 has_many :ingredient_recipes
 has_many :prep_methods
 has_many :ratings
 belongs_to :category
 belongs_to :user
 accepts_nested_attributes_for :ingredient_recipes
 accepts_nested_attributes_for :prep_methods
 accepts_nested_attributes_for :uploads
 # before_create :product_empty
 validates :author_name, :presence => true
 

  extend FriendlyId
  friendly_id :name, use: :slugged
   
 # def product_empty
 #   if products.empty?
 #     errors.add(:base, 'Products not  present in database ')
 #   end 
 # end

 LEVELS = %w[Easy Difficult Very_Difficult]

has_attached_file :photo,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>" }


def self.search(search)
  #if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  #else
   # find(:all)
  #end
end

  def origin_place_name
    origin_place.try(:country)
  end
  
  def origin_place_name=(country)
    self.origin_place = OriginPlace.find_or_create_by_country(country) if country.present?
  end



 def rater 
  self.ratings.count
 end 


 def total_rating
  self.ratings.sum(:value).to_f
 end 

 def aver_rating
  (total_rating/rater)
 end



end
