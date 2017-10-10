class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show]

  def index
    @users = User.paginate(page: params[:page], per_page:3)
  end

  def new
    @user = User.new
  end

  def show
    @user_article = @user.articles.paginate(page: params[:page], per_page:2)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully!!"
      redirect_to articles_path
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
