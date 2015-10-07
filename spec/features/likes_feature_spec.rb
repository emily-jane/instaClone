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
  click_link 'Add an image'
  fill_in 'Name', with: 'test'
  attach_file('Image', 'spec/files/images/test.jpg')
  click_button 'Create Image'
end

feature 'likes' do
  scenario 'image should start with no likes' do
    signup
    addimage
    expect(page).to have_content '0 Likes'
  end

  scenario 'should be able to like an image if you are signed in', js: true do
    signup
    addimage
    click_link 'Like'
    expect(page).to have_content '1 Like'
  end

  scenario 'should not be able to like an image or see images if you are not signed in', js: true do
    signup
    addimage
    click_link 'Sign out'
    expect(page).not_to have_content '0 Likes'
    expect(page).not_to have_link 'Like'
  end

  scenario 'user should only be able to like an image once', js: true do
    signup
    addimage
    click_link 'Like'
    click_link 'Like'
    click_link 'Like'
    expect(page).not_to have_content '3 Likes'
    expect(page).to have_content '1 Like'
  end
end

