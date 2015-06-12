class Item < ActiveRecord::Base
	belongs_to :item_kind
	has_many :item_in_orders
	has_many :orders, :through => :item_in_orders
end
