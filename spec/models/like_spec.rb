require 'rails_helper'

RSpec.describe Like, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:like).should be_valid
  end
  it "is invalid without a user_id" do
    FactoryGirl.build(:like, user_id: nil).should_not be_valid
  end
  it "is invalid without a post id" do
    FactoryGirl.build(:like, post_id: nil).should_not be_valid
  end
end
