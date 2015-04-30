require 'rails_helper'

RSpec.describe Request, type: :model do
  
  before do
    @user = FactoryGirl.create(:user)
    @another_user = FactoryGirl.create(:another_user)
  end
  
  it 'requires both ids' do
    FactoryGirl.create(:request).should be_valid
    FactoryGirl.build(:request, requestor_id: nil).should_not be_valid
    FactoryGirl.build(:request, requested_id: nil).should_not be_valid
  end
  
  it "correctly requests a friend" do
    @user.request_friend(@another_user)
    
    Request.count.should be(1)
    @user.friend_requests.count.should be(0)
    @another_user.friend_requests.should include(@user)
  end
end
