ActiveAdmin.register Item do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :description, :price, :image
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
index do
	column :name
	column :description
	column :price
	column :image do |item|
		image_tag item.image.url, size: '100x100'
	end
	actions
end

end
