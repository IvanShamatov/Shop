class ItemsController < ApplicationController
  def index
  	@k = ItemKind.all
  	if params[:kind].nil?
  		@i = Item.all
  	else
  		@i = Item.where(item_kind_id: params[:kind])
  	end	
  end

  def show
  end

  def cart
  	session[:cart].each do |s|
  		(@c ||= []) << [Item.find(s), session[:cart].count(s)]
  	end
    @c.uniq! unless @c.nil?
  end

  def cart_add
    (session[:cart] ||= []) << params[:item]
   	redirect_to action: "index"
  end

  def cart_del
    session[:cart].each_with_index do |val, index|
      session[:cart].delete_at(index) if params[:del_id] == val
    end  
    redirect_to action: "cart"
  end

  def category
  	@p = params.inspect
  	@k = ItemKind.all
  	@i = Item.all
  end
end
