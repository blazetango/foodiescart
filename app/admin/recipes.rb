ActiveAdmin.register Recipe do
  index do                            
    column :name                     
    column :origin_place_name                
    column :difficulty_level      
    column :course       
    column :servers 
    column :category
    column :tag_list
    column :prep_time
    column :cooking_time
    column :tips  
   
   
    default_actions                   
  end                                 
        form :partial => "form"                 

   

end
