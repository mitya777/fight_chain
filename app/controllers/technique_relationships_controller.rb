class TechniqueRelationshipsController < ApplicationController
  before_filter :authenticate

  def create
    if params[:commit] == "Add Parent" then
      @technique = Technique.find_by_id(params[:technique_relationship][:child_id])
      @parent = Technique.find_by_id(params[:technique_relationship][:parent_id])
      @technique.add_parent!(@parent)
      redirect_to @technique
    elsif params[:commit] == "Add Child" then
      @technique = Technique.find_by_id(params[:technique_relationship][:parent_id])
      @child = Technique.find_by_id(params[:technique_relationship][:child_id])
      @technique.add_child!(@child)
      redirect_to @technique
    end 
  end

  def destroy #one destroy method should handle both 
  end

  def add_parent
    
  end

  def add_child
  end
end
