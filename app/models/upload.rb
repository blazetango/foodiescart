class Upload < ActiveRecord::Base
  attr_accessible :recipe_id,:photo

belongs_to :recipe
  
 has_attached_file :photo,
     :styles => {
       :thumb=> "100x100#",
       :small  => "400x400>", 
       :medium => "600x600"    
 }
end
