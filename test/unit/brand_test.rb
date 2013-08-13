require 'test_helper'

describe Brand do

  it "creates a brand" do
    assert_difference('Brand.count') do
      Brand.new(name: "Mike's Bikes", profile: "The best bikes you can get.").save
    end
  end

end