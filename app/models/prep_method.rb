class PrepMethod < ActiveRecord::Base
  attr_accessible :steps,:recipe_id, :photo
  
  
  belongs_to :recipe

 has_attached_file :photo,
     :styles => {
        :thumb=> "100x100#",
       :small  => "400x400",
       :medium => "300x300>"
      }
end
