require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    category = Category.create name: 'Computers'
    product = category.products.create({
      name: "Nvidia 3080 GPU",
      quantity: 4,
      price: 3000,
      })
      it "should create valid product" do
        expect(product).to be_valid
      end
      it "product should have name" do
        product.name = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include "Name can't be blank"
      end
      it "product should have quantity" do
        product.quantity = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include "Quantity can't be blank"
      end
      it "product should have price" do
        product.price_cents = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include "Price can't be blank"
      end
      it "product should have category" do
        product.category = nil
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to include "Category can't be blank"
      end
  end
end