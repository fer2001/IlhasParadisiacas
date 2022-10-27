class IslandsController < ApplicationController
  before_action :set_island, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @islands = policy_scope(Island)
  end

  def show
    skip_authorization
  end

  def new
    @island = Island.new
    skip_authorization
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to island_path(@island)
    else
      render :new, status: :unprocessable_entity
    end
    skip_authorization
  end

  def edit
    authorize @restaurant
  end

  def update
    authorize @restaurant
  end

  def destroy
    authorize @restaurant
  end

  private

  def set_island
    @island = Island.find(params[:id])
  end

  def island_params
    params.require(:island).permit(:name, :description, :price, :location)
  end
end
