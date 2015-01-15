class CombineItemsInCart < ActiveRecord::Migration
  def up
  	#here we collapse list items into one with sum quanity 
  	Cart.all.each do |cart|
  		#here we sum all the quanities from all items in all carts
  		sums = cart.list_items.group(:product_id).sum(:quanity)

  		sums.each do |product_id, quanity|
  			if quanity >1 
  				cart.list_items.where(product_id: product_id).delete_all
  				item = cart.list_items.build(product_id: product_id)
  				item.quanity = quanity
  				item.save
  			end
  		end
  	end
  end

  def down
  	ListItem.where("quanity > 1").each do |list_item|
  		list_item.quanity.times do 
  			ListItem.create cart_id: list_item.cart_id,
  			product_id: list_item.product_id, quanity: 1
  		end

  		list_item.destroy
  	end
  end
end
