require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
    context 'Creating new product' do
      it "validates for name" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:nil, 
          quantity: 0,
          price: 64.99,
          category_id: @category.id
        )
        @product.save
        expect(@product.errors.full_messages ).to be_present 

      end
      it "validates for price" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: 0,
        
          category_id: @category.id
        )
        @product.save
         expect(@product.errors.full_messages ).to be_present 

      end
      it "validates for quantity" do
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
      it "validates for category" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: 0,
          price: 64.99,
          category_id:nil
        )
        @product.save
         expect(@product.errors.full_messages ).to be_present 
       
      end
      it "everything passes" do
        @category = Category.new(name: "trees")
        @category.save

        @product = Product.new(name:'tree life', 
          quantity: 1,
          price: 64.99,
          category_id:  @category.id
        )
        @product.save
         expect(@product).to be_present
      end
    end
  end
end
