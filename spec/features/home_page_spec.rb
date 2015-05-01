require 'rails_helper'


describe 'Homepage' do
  
  before do
    @user = FactoryGirl.create(:user)
  end
  
  it 'content should change when user logs in' do
    visit root_path
    page.should have_content "A recreation of Facebook written in Ruby on Rails"
    
    login_as(@user, :scope => :user)
    visit root_path
    page.should have_content "Friendfeed"
  end
end