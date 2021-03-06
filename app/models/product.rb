class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01 }
	validates :title, uniqueness: true, length: { minimun: 10, maximum: 100}
	validates :image_url, allow_blank: true, format:{
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'Please, select an GIF, JPG or PNG image'
	}

	before_destroy :ensure_not_referenced_by_any_list_item
	def self.latest
		Product.order(:updated_at).last
	end

	private

	def ensure_not_referenced_by_any_list_item
		if list_items.empty?
			return true
		else
			errors.add(:base, 'List items present')
			return false
		end
	end


end
