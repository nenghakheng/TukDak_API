class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  # def update
  #   if @user.update(user_params)
  #     redirect_to users_path
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @user.destroy
  #   redirect_to users_path
  # end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
