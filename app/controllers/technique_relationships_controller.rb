class TechniqueRelationshipsController < ApplicationController
  before_filter :authenticate

  def new
    if params[:child_id] #ADD PARENT: if child is present then we will be adding its parent
      @child = Technique.find params[:child_id]
      @select_parents = @child.possible_parents(current_user).paginate :page => params[:page], :per_page => 5
      @select_parents = Technique.search params[:search], 
        :with => {:sphinx_internal_id => current_user.techniques.collect(&:id)}, 
        :page => params[:page], :per_page => 10 unless !params[:search] || params[:search] == ""
      respond_to do |format|
        format.html {render 'add_parent'}
        format.js {render 'add_parent'}
      end
    end
    if params[:parent_id] #ADD CHILD: if parent is present then we are adding child
      @parent = Technique.find params[:parent_id]
      @select_children = @parent.possible_children(current_user).paginate :page => params[:page], :per_page => 5
      @select_children = Technique.search params[:search], 
        :with => {:sphinx_internal_id => current_user.techniques.collect(&:id)}, 
        :page => params[:page], :per_page => 10 unless !params[:search] || params[:search] == ""
      respond_to do |format|
        format.html {render 'add_child'}
        format.js {render 'add_child'}
      end
    end
  end

  def create 
    @parent = Technique.find(params[:technique_relationship][:parent_id])
    @child = Technique.find(params[:technique_relationship][:child_id])
    TechniqueRelationship.create!(:parent_id => @parent.id, :child_id => @child.id)
    if params[:origin] == 'child'
      respond_to do |format|
        format.html {redirect_to @child}
        format.js {render 'create_parent'}
      end
    else
      respond_to do |format|
        format.html {redirect_to @parent}
        format.js {render 'create_child'}
      end
    end
  end

  def destroy #one destroy method should handle both 
  end

end
