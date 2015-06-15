class OrdersController < ApplicationController
  def index
    @o = Order.where(user_id: current_user)
  end

  def create_order
    if !(current_user.nil?)
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
    else
       session[:cart].each do |s|
        (@sc ||= []) << [Item.find(s), session[:cart].count(s)]
      end
      @sc.uniq! unless @sc.nil?    

      @o = Order.new
      # @u = User.new(email: params[:email], phone_number: params[:phone_number], encrypted_password: {(0...50).map { ('a'..'z').to_a[rand(26)] }.join})
      # @u = User.new(user_params)
      @u = User.new(user_params)
      @u.save
      @o.user = @u
      @sc.each do |c|
        @o.items << Item.find_by(id: c[0].id)
        @o.item_in_orders.each {|x| x.quantity = c[1]}
      end
    end
  	@o.save
  	session.delete(:cart)
  	redirect_to controller:"items", action: "index"
  end

  def create_user
    @u = User.new
  end

  private
    def user_params
      params[:user][:password] = 'asdasdasd'
      params[:user][:password_confirmation] = 'asdasdasd'
      params.require(:user).permit(:email, :phone_number, :password, :password_confirmation)
    end
end
