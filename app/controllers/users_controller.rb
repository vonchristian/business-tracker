class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    load_users
  end

  def show
    load_user
  end

  def new
    build_user
  end

  def edit
     load_user
     build_user
  end
  def create
    build_user
    save_user or render 'new'
  end

  def update
    load_user
    build_user
    save_user or render 'edit'
  end

  def destroy
    load_user
    @user.destroy
    redirect_to users_path, :notice => 'User was successfully deleted.'
  end
end
private
  def user_params
    user_params = params[:user]
    user_params ? user_params.permit(:first_name, :last_name, :password, :password_confirmation, :email) : {}
  end
  def load_users
    @users ||= user_scope.to_a
  end
  def load_user
    @user ||= user_scope.find(params[:id])
  end
  def build_user
    @user ||= user_scope.build
    @user.attributes = user_params
  end
  def save_user
    if @user.save
      redirect_to users_path,:notice => "registered successfully."
    end
  end
  def user_scope
    User.all
  end
