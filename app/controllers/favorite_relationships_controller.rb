class FavoriteRelationshipsController < ApplicationController

  def create
    @favorite_relationship = current_user.favorite_relationships.build(:technique_id => params[:technique_id])
    if @favorite_relationship.save
      flash[:notice] = "Technique successfully added to favorites"
      redirect_to root_url
    else
      flash[:error] = "Unable to add technique to favorites"
      redirect_to technique_path params[:technique_id]
    end
  end

  def destroy
    @fav_rel = current_user.favorite_relationships.find params[:id]
    @fav_rel.destroy
    @favorite_relationships = current_user.favorite_relationships.paginate :page => params[:page],
                                                          :per_page => 9, :order => "created_at DESC"
    respond_to do |format|
      format.html {redirect_to favorites_techniques_path }
      format.js 
    end
  end
end
