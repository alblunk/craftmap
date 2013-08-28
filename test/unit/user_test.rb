require "test_helper"

describe User do

  describe "scopes" do

    it "finds only the admins" do
      User.admins.each do |user|
        assert user.admin?
      end
    end

    it "finds only the non admins" do
      User.non_admins.each do |user|
        refute user.admin?
      end
    end

  end

end
