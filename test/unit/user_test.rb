require "test_helper"

describe User do

  let(:user) { User.new(email: "me@foo.com") }

  it "will save a new user with a valid password" do
    user.password = "Ea3!-HSF14csag$adfjdjdhh3XX"
    assert user.save
  end

  it "will not save a new user with an invalid password" do
    user.password = "short"
    refute user.save
    assert user.errors.messages[:password]
  end
end
