require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:comment).should be_valid
  end
  it "is invalid without content" do
    FactoryGirl.build(:comment, content: nil).should_not be_valid
  end
  it "is invalid without a user id" do
    FactoryGirl.build(:comment, user_id: nil).should_not be_valid
  end
  it "is invalid without a post id" do
    FactoryGirl.build(:comment, post_id: nil).should_not be_valid
  end
end
