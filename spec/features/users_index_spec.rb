require 'rails_helper'


describe 'Pagination' do
  
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  
  it 'should include pages' do
    40.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = "Password"
      User.create!(name:  name,
                   email: email,
                   password:              password,
                   password_confirmation: password,)
    end
    
    visit users_path
    page.should have_content("All Users")
    
    page.should have_css('div.pagination')
  end
  
end