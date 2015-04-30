require 'rails_helper'

RSpec.describe Friendship, type: :model do
  
  before do
    @user = FactoryGirl.create(:user)
    @another_user = FactoryGirl.create(:another_user)
  end
  
  it 'requires both ids' do
    FactoryGirl.create(:friendship).should be_valid
    
    FactoryGirl.build(:friendship, user_id: nil).should_not be_valid
    FactoryGirl.build(:friendship, friend_user_id: nil).should_not be_valid
  end
  
  it "correctly creates a friendship" do
    @user.create_friendship(@another_user)
    
    Friendship.count.should be(2)
    @user.friends.should include(@another_user)
    @another_user.friends.should include(@user)
  end
  
end
