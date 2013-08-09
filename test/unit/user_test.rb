require 'test_helper'

describe User do
  it "will save a new user with a valid password" do
    user = User.new(:email => 'me@foo.com', :password => 'Str0ngPassword!')
    assert user.save
  end

  it "will not save a new user with an invalid password" do
    user = User.new(:email => 'me@foo.com', :password => 'short')
    refute user.save
    assert user.errors
  end
end
