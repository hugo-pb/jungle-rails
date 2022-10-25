require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validations' do
    context 'Creating new product' do
      it "validates for a name" do
        @product = Product.new
        expect(@product.id).to be_nil
      end
    end
  end
end
