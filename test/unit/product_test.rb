require 'test_helper'

describe Product do

  let(:brand) { brands(:one) }
  let(:product) { Product.new(name: 'A Scarf', description: 'Also warm.') }

  it "creates a product" do
    assert_difference('Product.count') do
      brand.products.new(product.attributes).save
    end
  end

  it "requires a brand to save a product" do
    assert_no_difference('Product.count') do
      product.save
      assert product.errors.messages[:brand]
    end
  end

end
