class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user, :only => :destroy

  def techniques
    @title = "#{current_user.name}'s Techniques"
    @techniques = current_user.techniques.paginate :page => params[:page],
                                                   :per_page => 10
  end

  def new
    @user = User.new
    @title = "Sign Up"
  end

  def index
    @title = "All users"
    @users = User.paginate :page => params[:page]
  end

  def show
    @user = User.find(params[:id])
    @videos = @user.techniques.paginate(:page => params[:page])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  

  private

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user? @user
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
