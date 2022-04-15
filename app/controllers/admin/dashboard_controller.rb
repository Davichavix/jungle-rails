class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN"], password: ENV["PASSWORD"],
  if: -> { ENV["PASSWORD"].present? }
  def show
    @products_count = Product.all().count
    @categories_count = Category.all().count
  end
end
