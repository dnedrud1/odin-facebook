require 'rails_helper'


describe 'UserProfile' do
  
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  
  it 'should allow user to add profile' do
    visit edit_profile_path(@user)
    page.should have_content("Optional Profile Info for Daniel Nedrud")
    
    expect do
      fill_in('profile_birthday', :with => Date.parse('2001-02-03'))
      fill_in('profile_home_city', :with => 'New York, NY')
      choose('Female')
      choose('Single')
      click_button "Submit"
    end.to change{ Profile.count }.by(1)
    
    @user.profile.should_not be_nil
    
    page.should have_content("Home City: New York, NY")
  end
  
  it 'should allow user to add partial profile' do
    visit edit_profile_path(@user)
    page.should have_content("Optional Profile Info for Daniel Nedrud")
    
    expect do
      fill_in('profile_birthday', :with => Date.parse('2001-02-03'))
      choose('Female')
      click_button "Submit"
    end.to change{ Profile.count }.by(1)
    
    @user.profile.should_not be_nil
    
    page.should_not have_content("Home City:")
    page.should_not have_content("Relationship Status:")
    page.should have_content("Gender: Female")
  end
  
end