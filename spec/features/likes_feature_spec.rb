require 'rails_helper'

def signup
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

feature 'likes' do
  scenario 'image should start with no likes' do
    signup
    visit '/images'
    click_link 'Add an image'
    fill_in 'Name', with: 'test'
    click_button 'Create Image'
    expect(page).to have_content 'Likes: 0'
  end

  # scenario 'should be able to like an image if you are signed in' do
  #   signup
  #   visit '/images'
  #   click_link 'Add an image'
  #   fill_in 'Name', with: 'test'
  #   click_button 'Create Image'
  #   click_button 'Like'
  #   expect(page).to have_content 'Likes: 1'
  # end

  # scenario 'should not be able to like an image if you are not signed in, but can see likes' do
  #   signup
  #   visit '/images'
  #   click_link 'Add an image'
  #   fill_in 'Name', with: 'test'
  #   click_button 'Create Image'
  #   click_link 'Sign out'
  #   expect(page).to have_content 'Likes: 0'
  #   expect(page).not_to have_button 'Like'
  # end

  # scenario 'user should only be able to like an image once' do
  #   signup
  #   visit '/images'
  #   click_link 'Add an image'
  #   fill_in 'Name', with: 'test'
  #   click_button 'Create Image'
  #   click_button 'Like'
  #   click_button 'Like'
  #   expect(page).to have_content 'Likes: 1'
  # end
end

