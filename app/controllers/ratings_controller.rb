class RatingsController < ApplicationController

def index 
@rating = Rating.all
end 

def new
@rating = Rating.new 
end 

def create
 @rating = Rating.new(params[:rating])
  if @rating.save
   @recipe_update = @rating.recipe.update_attributes(:tested => (@rating.recipe.tested)+1)
   redirect_to @rating.recipe 
   else 
   redirect_to @rating.recipe,  notice: 'rating can be done only once' 
  end 
end 

def show 

end 

end
