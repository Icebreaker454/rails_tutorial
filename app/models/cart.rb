class Cart < ActiveRecord::Base
	has_many :list_items, dependent: :destroy

	def add_product(product_id)
		current_item = list_items.find_by(product_id: product_id)
		if current_item
			current_item.quanity += 1
		else 
			current_item = list_items.build(product_id: product_id)
		end
		current_item
	end
end
