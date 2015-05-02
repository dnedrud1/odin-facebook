require 'rails_helper'


describe 'UsersContent' do
  
  before do
    @user = FactoryGirl.create(:user)
    @another_user = FactoryGirl.create(:another_user)
    login_as(@user, :scope => :user)
  end
  
  it 'allows friend request to be sent' do
    visit user_path(@another_user)
    
    expect do
      click_link "Befriend"
    end.to change{ Request.count }.by(1)
    
    page.should have_content("Friend request sent!")
    
    @another_user.friend_requests.should include(@user)
  end
  
  it "allows friend request to be accepted" do
    @user.friend_requests << @another_user
    visit requests_path
    
    expect do
      click_link "Accept"
    end.to change{ Request.count }.by(-1)
    
    Friendship.count.should be(2)
    page.should have_content("Friendship created!")
    @user.friends.should include(@another_user)
    @another_user.friends.should include(@user)
  end
  
  it "allows friend request to be denied" do
    FactoryGirl.create(:request)
    visit requests_path
    
    expect do
      click_link "Reject"
    end.to change{ Request.count }.by(-1)

    Friendship.count.should be(0)
    @user.friends.should_not include(@another_user)
  end
  
end