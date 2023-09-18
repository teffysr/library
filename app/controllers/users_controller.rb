class UsersController < ApplicationController
  def index
    @users = User.all
    if params[:identification].present?
      @users = @users.where(identification: params[:identification])
    end
    if params[:name].present?
      @users = @users.where(name: params[:name])
    end
    if params[:address].present?
      @users = @users.where(editorial: params[:address])
    end
    if params[:email].present?
      @users = @users.where(email: params[:email])
    end
    if params[:phone].present?
      @users = @users.where(phone: params[:phone])
    end
    render json: @users
  end

  def show
    begin
      render json: user, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    begin
      user.update(user_params)
      render json: user, status: :ok
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    end
  end

  def destroy
    begin
      user.destroy
      render json: { message: 'El usuario se ha eliminado correctamente' }, status: :see_other
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :not_found
    rescue ActiveRecord::InvalidForeignKey => e
      render json: { error: e.message }, status: :not_found
    end
  end

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name, :identification, :email, :address, :phone)
  end
end
