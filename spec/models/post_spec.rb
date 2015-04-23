require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without content" do
    FactoryGirl.build(:post, content: nil).should_not be_valid
  end
  it "is invalid without a user id" do
    FactoryGirl.build(:post, user_id: nil).should_not be_valid
  end
end
