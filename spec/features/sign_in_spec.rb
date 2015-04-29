require 'rails_helper'


describe 'SignIn' do
  
  before do
    FactoryGirl.create(:user)
  end
  
  it 'should allow me to sign in with valid info' do
    visit new_user_session_path
    fill_in 'user_email', :with => 'dnedrud1@example.com'
    fill_in 'user_password', :with => 'Password'
    click_button "Log in"
    page.should have_content("Signed in successfully.")
  end
  
  it 'should prevent me from signing in with invalid info' do
    visit new_user_session_path
    fill_in 'user_email', :with => 'dnedrud1@example.com'
    fill_in 'user_password', :with => 'WrongPassword'
    click_button "Log in"
    page.should have_content("Invalid email or password.")
  end
end