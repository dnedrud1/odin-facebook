require 'rails_helper'


describe 'Homepage' do
  
  before do
    visit root_path
  end
  
  it 'should have home page content' do
    page.should have_content "Facebook Rails Application"
  end
end