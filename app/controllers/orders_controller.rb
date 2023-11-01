class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    if @order.save
      render json: { message: 'Order created successfully' }, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    @orders = Order.all # Retrieve all records from the Order table
    render json: @orders # Respond with JSON containing all records
  end
  
  private

  def order_params
    params.require(:order).permit(:"PO Number", :"Part Number", :"Part Description", :"Division Delivery", :"Quantity", :"Unit Price", :"CGST", :"Sgst")
  end
end
