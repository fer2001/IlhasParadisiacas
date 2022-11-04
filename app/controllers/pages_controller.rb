class PagesController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: show

  def show
  end

  def edit
    authorize @user
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @user
  end

  def destroy
    @user.destroy
    redirect_to profile_users_path, status: :see_other
    authorize @user
  end

  private

  def set_user
    if user_exists?
      @user = user.find(params[:id])
    else
      redirect_to users_path, status: :see_other
    end
  end

  def user_exists?
    user.all.any? { |user| user.id == params[:id].to_i }
  end
end
