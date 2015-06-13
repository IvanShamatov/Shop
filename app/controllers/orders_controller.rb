class OrdersController < ApplicationController
  def index
    @o = Order.where(user_id: current_user)
  end

  def create_order
    session[:cart].each do |s|
      (@sc ||= []) << [Item.find(s), session[:cart].count(s)]
    end
    @sc.uniq! unless @sc.nil?    

  	@o = Order.new
  	@o.user = current_user
  	@sc.each do |c|
  		@o.items << Item.find_by(id: c[0].id)
      @o.item_in_orders.each {|x| x.quantity = c[1]}
  	end
  	@o.save
  	session.delete(:cart)
  	redirect_to action: "index"
  end
end
