class VideosController < ApplicationController
  def new
    @video = Video.new
    @title = "Create Video"
  end

  def create
    @video = current_user.videos.build(params[:video])
    if @video.save
      redirect_to @video
    else
      @title = "Create Video"
      render 'new'
    end
  end

  def show
    @video = Video.find(params[:id])
    @title = @video.name
  end

  def edit
    @title = "Edit Video"
  end

  def update

  end

  def destroy
  end

end
