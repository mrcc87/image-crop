class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def crop
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      if user_params[:avatar].blank?
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :crop
      end
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      if user_params[:avatar].blank?
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :crop
      end
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.delete_avatar
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :crop_x, :crop_y, :crop_w, :crop_h)
  end
end
