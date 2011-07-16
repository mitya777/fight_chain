class TechniquesController < ApplicationController
  before_filter :authenticate, :only => [:index, :new, :create, :destroy, :save]

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
    @title = "#{current_user.name}'s Techniques"
    @techniques = current_user.techniques.search params[:search],
                                   :page => params[:page],  
                                   :per_page => 10
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @technique = Technique.find(params[:id]) 
    @title = @technique.name
  end

  def edit
  end

  def update
    @technique = Technique.find(params[id])
    @technique.update_attributes(params[:technique])
  end

  def destroy
  end

  def save
    logger.debug "CURRENT USER: #{current_user}"
    @technique = current_user.techniques.build(:name => params[:name]) 
    if @technique.save!
      @video = @technique.videos.build(:name => params[:name], :url => params[:url])
      if @video.save!
        render :text => "Great Success!"
      end
    end
  end

end
