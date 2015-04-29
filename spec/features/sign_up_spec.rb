require 'rails_helper'


describe 'SignUp' do
  
  before do
    
  end
  
  it 'should allow user to sign up with valid info' do
    visit new_user_registration_path
    
    expect do
      fill_in 'user_name', :with => 'Bob Whiley'
      fill_in 'user_email', :with => 'bob@example.com'
      fill_in 'user_password', :with => 'Password'
      fill_in 'user_password_confirmation', :with => 'Password'
      click_button "Sign up"
    end.to change{ User.count }.by(1)
    
    page.should have_content("Welcome! You have signed up successfully.")
  end
  
  it 'should not allow user to sign up with invalid password' do
    visit new_user_registration_path
    
    expect do
      fill_in 'user_name', :with => 'Bob Whiley'
      fill_in 'user_email', :with => 'bob@example.com'
      fill_in 'user_password', :with => 'xxx'
      fill_in 'user_password_confirmation', :with => 'xxx'
      click_button "Sign up"
    end.to_not change{ User.count }
    
    page.should have_content("Password is too short (minimum is 8 characters)")
  end
  
  it 'should not allow user to sign up with missing email' do
    visit new_user_registration_path
    
    expect do
      fill_in 'user_name', :with => 'Bob Whiley'
      fill_in 'user_email', :with => ''
      fill_in 'user_password', :with => 'Password'
      fill_in 'user_password_confirmation', :with => 'Password'
      click_button "Sign up"
    end.to_not change{ User.count }
    
    page.should have_content("Email can't be blank")
  end
end