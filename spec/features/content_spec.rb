require 'rails_helper'


describe 'UsersContent' do
  
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end
  
  it 'should allow user to post something' do
    visit user_path(@user)
    page.should have_content("Profile for Daniel Nedrud")
    
    expect do
      fill_in 'post_content', :with => 'This is a test post.'
      click_button "Post"
    end.to change{ Post.count }.by(1)
    
    page.should have_content("This is a test post.")
  end
  
  it 'should not allow blank post' do
    visit user_path(@user)
    
    expect do
      fill_in 'post_content', :with => ''
      click_button "Post"
    end.to_not change{ Post.count }
  end
  
  it 'should allow comments to be posted' do
    @user.posts.create(content: "This is a test post.")
    visit user_path(@user)
    page.should have_content("This is a test post.")
    
    expect do
      fill_in 'comment_content', :with => 'This is a test comment.'
      within(".comment-well") do
        click_button "Post"
      end
    end.to change{ Comment.count }.by(1)
    
    page.should have_content("This is a test comment.")
    
    visit root_path
    
    expect do
      fill_in 'comment_content', :with => 'This is another test.'
      click_button "Post"
    end.to change{ Comment.count }.by(1)
    
    page.should have_content("This is another test.")
    
  end
  
  it 'should allow post deletion' do
    @user.posts.create(content: "This is a test post.")
    visit user_path(@user)
    
    expect do
      click_link "delete"
    end.to change{ Post.count }.by(-1)
    
    page.should_not have_content("This is a test post.")
  end
  
  it 'should allow liking and unliking' do
    @user.posts.create(content: "This is a test post.")
    visit user_path(@user)
    
    expect do
      click_link "like"
      page.should have_content("unlike")
    end.to change{ Like.count }.by(1)
    
    expect do
      click_link "unlike"
      page.should have_content("like")
    end.to change{ Like.count }.by(-1)
  end
  
end