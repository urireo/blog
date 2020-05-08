class OrdersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  layout 'costumer_layout' #this will check for flash alerts

  def index
    @orders = Order.all
  end

  def show

  end

  def new
  @order = Order.new
  end

  def edit

  end

  def create
    @order = Order.new(order_params)
    if @order.save #if this returns not nill values, then it is success
      flash.notice = "The record was created successfully."
      redirect_to @order
    else
      flash.now.alert = @order.errors.full_messages.to_sentence
      render :new
    end
  end


  def update
    if @order.update(order_params) #if this returns not nill values, then it is success
      flash.notice = "The order record was created successfully."
      redirect_to @order
    else
      flash.now.alert =@order.errors.full_messages.to_sentence
      render :edit
    end
  end


  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:product_name, :product_count, :costumer_id)
    end
    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to orders_path
    end


end
