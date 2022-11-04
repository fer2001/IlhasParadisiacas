class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    authorize @user
  end

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


  def destroy
    @order.destroy
    redirect_to profile_orders_path, status: :see_other
    authorize @order
  end
end
