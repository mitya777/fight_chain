class TechniqueRelationshipsController < ApplicationController
  before_filter :authenticate

  def new
    if params[:child_id] #ADD PARENT: if child is present then we will be adding its parent
      @child = Technique.find params[:child_id]
      @select_parents = @child.possible_parents(current_user)
      respond_to do |format|
        format.html {render 'add_parent'}
        format.js {render 'add_parent'}
      end
    end
    if params[:parent_id] #ADD CHILD: if parent is present then we are adding child
      @parent = Technique.find params[:parent_id]
      @select_children = @parent.possible_children(current_user)
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
      format.html {redirect_to Technique.find(params[:origin])}
      format.js
    end
  end

  def destroy #one destroy method should handle both 
  end

end
