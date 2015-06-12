class ItemsController < ApplicationController
  def index
 	@p = params.inspect
  	@k = ItemKind.all
  	@i = Item.all
  end

  def show
  end

  def cart
  end
end
