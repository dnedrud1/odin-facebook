require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:profile).should be_valid
  end
  it "is invalid when date is not datetime" do
    FactoryGirl.build(:profile, birthday: "aaa").should_not be_valid
  end
  it "is invalid without a user id" do
    FactoryGirl.build(:profile, user_id: nil).should_not be_valid
  end
end
