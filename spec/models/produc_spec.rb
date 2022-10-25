require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
    context 'Creating new product' do
      it "validates for name" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: 0,
          price: 64.99,
          category_id: @category.id
        )
        @product.save!
        expect(@product.name).to be_present
      end
      it "validates for price" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: 0,
          price: 64.99,
          category_id: @category.id
        )
        @product.save!
        expect(@product.price).to be_present
      end
      it "validates for quantity" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: 0,
          price: 64.99,
          category_id: @category.id
        )
        @product.save!
        expect(@product.quantity).to be_present
      end
      it "validates for category" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: 0,
          price: 64.99,
          category_id: @category.id
        )
        @product.save!
        expect(@product.category).to be_present
      end
      it "Error when missing something" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: nil,
          price: 64.99,
          category_id: @category.id
        )
        @product.save
        expect(@product.errors.full_messages ).to be_present 
      end
    end
  end
end
