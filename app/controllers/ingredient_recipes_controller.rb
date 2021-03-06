class IngredientRecipesController < ApplicationController
  # GET /ingredient_recipes
  # GET /ingredient_recipes.json
  def index
    @ingredient_recipes = IngredientRecipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ingredient_recipes }
    end
  end

  # GET /ingredient_recipes/1
  # GET /ingredient_recipes/1.json
  def show
    @ingredient_recipe = IngredientRecipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ingredient_recipe }
    end
  end

  # GET /ingredient_recipes/new
  # GET /ingredient_recipes/new.json
  def new
    @ingredient_recipe = IngredientRecipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ingredient_recipe }
    end
  end

  # GET /ingredient_recipes/1/edit
  def edit
    @ingredient_recipe = IngredientRecipe.find(params[:id])
  end

  # POST /ingredient_recipes
  # POST /ingredient_recipes.json
  def create
    @ingredient_recipe = IngredientRecipe.new(params[:ingredient_recipe])

    respond_to do |format|
      if @ingredient_recipe.save
        format.html { redirect_to @ingredient_recipe, notice: 'Ingredient recipe was successfully created.' }
        format.json { render json: @ingredient_recipe, status: :created, location: @ingredient_recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @ingredient_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ingredient_recipes/1
  # PUT /ingredient_recipes/1.json
  def update
    @ingredient_recipe = IngredientRecipe.find(params[:id])

    respond_to do |format|
      if @ingredient_recipe.update_attributes(params[:ingredient_recipe])
        format.html { redirect_to @ingredient_recipe, notice: 'Ingredient recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ingredient_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredient_recipes/1
  # DELETE /ingredient_recipes/1.json
  def destroy
    @ingredient_recipe = IngredientRecipe.find(params[:id])
    @ingredient_recipe.destroy

    respond_to do |format|
      format.html { redirect_to ingredient_recipes_url }
      format.json { head :no_content }
    end
  end
end
