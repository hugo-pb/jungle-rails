class Admin::CategoriesController < ApplicationController

  def index
    @categories = category.order(id: :desc).all
  end

  def new
    @category = category.new
  end

  def create
    @category = category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'category created!'
    else
      render :new
    end
  end

end
