class Order < ActiveRecord::Base
	has_many :item_in_orders
	has_many :items, :through => :item_in_orders
	belongs_to :user
end
