class TechniquesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def new
    @technique = Technique.new
    1.times {@technique.videos.build} #add dynamic video addition functionality
    @title = "Create Technique"
  end

  def create
    @technique = current_user.techniques.build(params[:technique])
    @technique.save
  end

  def index
    @title = "All Techniques"
    @techniques = Technique.search params[:search],
                                   :page => params[:page],  
                                   :per_page => 10
  end

  def show
    @technique = Technique.find(params[:id]) 
    @title = @technique.name
  end

  def add_parent
    @technique = Technique.find(params[:id])
  end

  def add_child
  end

  def edit
  end

  def update
    @technique = Technique.find(params[id])
    @technique.update_attributes(params[:technique])
  end

  def destroy
  end

end
