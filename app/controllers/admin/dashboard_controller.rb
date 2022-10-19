class Admin::DashboardController < ApplicationController
   http_basic_authenticate_with name: ENV["NAME"], password: ENV["PASSWORD"]

  def show
@count_products = Product.count
@count_categories = Category.count
  #fetch and pass data to template
  end
end
