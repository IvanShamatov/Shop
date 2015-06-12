class OrdersController < ApplicationController
  def index
  end

  def create_order
  	@o = Order.new
  	@o.user = current_user
  	session[:cart].each do |c|
  		@o.items << c
  	end
  	@o.save
  	session.delete(:cart)
  	redirect_to action: "index"
  end
end
