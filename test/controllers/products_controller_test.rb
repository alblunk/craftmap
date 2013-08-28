require 'test_helper'

describe ProductsController do
  include Devise::TestHelpers

  before { sign_in users(:admin) }

  let(:brand) { brands(:one) }
  let(:product) { products(:one) }
  
  describe "#index" do

    it "succeeds" do
      get :index, brand_id: brand.id
      assert_response :success
      assert_not_nil assigns(:products)
    end

  end

  describe "#new" do

    it "succeeds" do
      get :new, brand_id: brand.id
      assert_response :success
    end

  end

  describe "#create" do

    it "succeeds" do
      assert_difference('Product.count') do
        post :create, brand_id: brand.id, product: { name: 'Pants', description: "They're blue!" }
      end

      assert_redirected_to brand_product_path(brand, assigns(:product))
    end

  end

  describe "#show" do

    it "succeeds" do
      get :show, brand_id: brand.id, id: product
      assert_response :success
    end

  end

  describe "#update" do
    
    it "succeeds" do
      put :update, brand_id: brand.id, id: product.id, product: { description: "Actually they're pink!" }
      assert_redirected_to brand_product_path(brand, assigns(:product))
    end

  end

  describe "#destroy" do

    it "succeeds" do
      assert_difference('Product.count', -1) do
        delete :destroy, brand_id: brand.id, id: product
      end

      assert_redirected_to products_path
    end

  end
end
