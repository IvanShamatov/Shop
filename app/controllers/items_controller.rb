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
  end

  def category
  	@p = params.inspect
  	@k = ItemKind.all
  	@i = Item.all
  end
end
