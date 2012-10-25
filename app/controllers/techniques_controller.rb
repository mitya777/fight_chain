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
    @techniques = current_user.techniques.paginate :page => params[:page],
                                                   :per_page => 9, :order => "created_at DESC"
    respond_to do |format|
      format.html
      format.js
    end
  end

  def favorites
  #two database calls here? maybe derive favorites from favorite relationships in memory instead?
    @favorite_relationships = current_user.favorite_relationships.paginate :page => params[:page], 
                                                           :per_page => 9, :order => "created_at DESC"
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
    @technique = Technique.find params[:id]
    1.times {@technique.videos.first} #add dynamic video addition functionality
    @title = "Edit Technique"
  end

  def update
    @technique = Technique.find(params[:id])
    @technique.update_attributes(params[:technique])
    redirect_to @technique
  end

  def destroy
    Technique.find(params[:id]).destroy
    redirect_to techniques_path
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

  def library
    @techniques = Technique.where "shared != ?", nil
  end


  def share
    @technique = Technique.find_by_id params[:id]
    @positions = ["Takedown", "Closed_Guard", "Open_Guard", "Half_Guard", "Side_Mount", "Mount", "North_South", "Back_Mount"]
    #@types = ["leg-attack", "throw"]
    respond_to do |format|
      format.html {render 'share'}
      format.js {render 'share'}
    end 
  end

    def update_types
        Rails.logger.debug params[:position]
        positions = {
            "takedown" => ["leg-attack", "throw"],
            "guard" => ["sweep", "pass", "submission"],
            "mount" => ["submission", "transition"]  
        }
        position = params[:position]
        if position == "Takedown" 
          position = "takedown"  
        elsif ["Closed_Guard", "Open_Guard", "Half_Guard"].include? position 
          position = "guard"
        elsif ["Side_Mount", "Mount", "North_South", "Back_Mount"].include? position 
          position = "mount" 
        end
        Rails.logger.debug position
        @types = positions[position] || ["empty"]
        @types.unshift ["- select -", ""]
        Rails.logger.debug @types
        render :layout => false
    end  

end
