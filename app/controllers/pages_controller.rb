class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      redirect_to :controller => "users", :action => "show", :id => current_user.id
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

end
