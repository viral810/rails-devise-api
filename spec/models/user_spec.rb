require 'rails_helper'

RSpec.describe User, type: :model do
  it "should successfully create new userl" do
    user = build(:user)

    assert user.save
  end

  it "should raise validation error when creating user without username" do
    user = build(:user, username: nil)

    refute user.save
  end

  it "should raise a validation error if trying to save user without valid email"

  it "should raise a validation error if trying to save user without valid password"
end
