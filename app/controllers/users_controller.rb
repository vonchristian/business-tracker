class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    authorize @users
    load_users
    authorize @users
  end

  def show
    load_user
    authorize @user
  end

  def new
    build_user

  end

  def edit
     load_user
     authorize @user
     build_user
  end
  def create
    build_user
    save_user or render 'new'
  end

  def update
    load_user
    authorize @user
    build_user
    save_user or render 'edit'
  end

  def destroy
    load_user
    authorize @user
    @user.destroy
    redirect_to users_path, notice: "Employee access deactivated successfully."
  end

end
private
  def user_params
    user_params = params[:user]
    user_params ? user_params.permit(:profile_image, :first_name, :last_name, :password, :password_confirmation, :email, :role) : {}
  end
  def load_users
    @users ||= user_scope.to_a
  end
  def load_user
    @user ||= user_scope.find(params[:id])
  end
  def build_user
    @user ||= user_scope.build
    authorize @user
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
