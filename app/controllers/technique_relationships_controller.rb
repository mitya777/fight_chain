class TechniqueRelationshipsController < ApplicationController
  before_filter :authenticate

  def add_parent
    @technique = Technique.find(params["id"])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def add_child
    @technique = Technique.find(params["id"])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    if params[:child_id]
      @technique = Technique.find params[:child_id]
      respond_to do |format|
        format.html {render 'add_parent'}
        format.js
      end
    end
    if params[:parent_id]
      @technique = Technique.find params[:parent_id]
      respond_to do |format|
        format.html {render 'add_child'}
        format.js
      end
    end
  end

  def create 
    parent_id = params[:technique_relationship][:parent_id]
    child_id = params[:technique_relationship][:child_id]
    TechniqueRelationship.create!(:parent_id => parent_id, :child_id => child_id)
    respond_to do |format|
      format.html {redirect_to Technique.find(params[:technique][:id])}
      format.js
    end
  end

  def destroy #one destroy method should handle both 
  end

end
