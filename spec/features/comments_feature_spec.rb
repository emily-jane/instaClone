require 'rails_helper'

def signup
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def addimage
  visit '/images'
  click_link 'Add an image'
  fill_in 'Name', with: 'test'
  attach_file('Image', 'spec/files/images/test.jpg')
  click_button 'Create Image'
end

feature 'commenting' do

  scenario 'allows users to leave a comment using a form' do
    signup
    addimage
    click_link 'Comment'
    fill_in "Thoughts", with: "nice logo makers"
    click_button 'Leave Comment'

    expect(current_path).to eq '/images'
    expect(page).to have_content 'nice logo makers'
  end
end