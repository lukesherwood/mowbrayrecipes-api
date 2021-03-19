class Api::V1::UsersController < ApplicationController
  before_action :set_params_user, only: %i[update show destroy]

  def show
    if @user
      render json: @user
    else
      render json: { message: 'user not found' }
    end
  end

  def update
    render json: UserSerializer.new(@user).serializable_hash.to_json, status: 200 if @user.update(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user).serializable_hash.to_json, status: 200
    else
      render json: { message: 'user not created' }
    end
  end

  def destroy
    if @user.destroy
      render body: {}, status: :no_content
    else
      render json: { message: 'Error deleting user' }
    end
  end

  private

  def set_params_user
    @user = User.find(user_params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :id)
  end
end
