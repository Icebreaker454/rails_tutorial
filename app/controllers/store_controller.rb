class StoreController < ApplicationController
	include Counter

	before_action :set_count, only: [:index]

  def index
  	@products = Product.order(:title)
  	@currency = params[:currency]
  end
end
