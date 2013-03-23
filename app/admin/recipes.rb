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

                     

  form do |f|                         
    f.inputs "Recipes" do       
      f.input :name	                  
      f.input :origin_place_name, data: {autocomplete_source: origin_places_path}
      f.input :difficulty_level , :collection => ["easy","difficult"]
      f.input :course  , :collection => [ "starters","main course","desserts"]
      f.input :servers 
      f.input :category_id, :as=>:select ,:collection => Category.all
      f.input :tag_list
      f.input :prep_time
      f.input :tested, :as => :hidden , :input_html => {:value=> 0}
      f.input :cooking_time
      f.input :tips
      f.input :photo    
      f.input :author_name
      f.input :user_id,  :as => :hidden ,:input_html => { :value => current_user.id }
    
 end                               
    f.buttons                         
  end                                 
   

end
