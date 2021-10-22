class CatalogueController < ApplicationController

  def index
    @products = Product.order(:title).limit(3)
  end
end
