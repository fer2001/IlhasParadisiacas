class OrdersController < ApplicationController
  def new
    @order = Order.new
    @island = Island.find(params[:island_id])
    authorize @order
  end

  def create
    @order = Order.new(checkin: params[:checkin], checkout: params[:checkout], island_id: params[:island_id], user_id: current_user.id)
    @island = @order.island
    authorize @order
    if @order.save
      redirect_to island_path(@island)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
