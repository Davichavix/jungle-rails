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
  end
end