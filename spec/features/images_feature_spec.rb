require 'rails_helper'

def signup
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def signuptwo
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'testtwo@example.com')
  fill_in('Password', with: 'testtesttest')
  fill_in('Password confirmation', with: 'testtesttest')
  click_button('Sign up')
end

def addimage
  visit '/images'
  click_link 'Add an image'
  fill_in 'Name', with: 'test'
  attach_file('Image', 'spec/files/images/test.jpg')
  click_button 'Create Image'
end

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      signup
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do

    scenario 'display images and image name' do
      signup
      addimage
      expect(page).to have_content 'test'
      expect(page).to have_css ('img[src*="test.jpg"]')
      expect(page).not_to have_content 'No images yet'
    end
  end

  context 'adding images' do
    scenario 'prompts user to fill out a form, then displays the new image and name if they are logged in' do
      signup
      addimage
      expect(page).to have_content 'test'
      expect(page).to have_css ('img[src*="test.jpg"]')
      expect(current_path).to eq '/images'
    end

    scenario 'user should not be allowed to add image if not signed in' do
      visit '/images'
      expect(page).not_to have_link 'Add an image'
    end
  end

  context 'viewing images' do

    scenario 'lets a user view the whole image' do
      signup
      addimage
      click_link('mainimage')
      expect(page).to have_content 'test'
      expect(page).to have_css ('img[src*="test.jpg"]')
      expect(current_path).not_to eq '/images'
    end
  end

  context 'editing images' do

    scenario 'let a user edit an image and image name if they created it' do
      signup
      addimage
      click_link 'Edit'
      fill_in 'Name', with: 'rails'
      attach_file('Image', 'spec/files/images/rails.jpg')
      click_button 'Update Image'
      expect(page).to have_content 'rails'
      expect(page).to have_css ('img[src*="rails.jpg"]')
      expect(current_path).to eq '/images'
    end

    scenario 'does not let a user edit an image if they did not create it' do
      signup
      addimage
      click_link 'Sign out'
      signuptwo
      expect(page).to have_content 'test'
      expect(page).to have_css ('img[src*="test.jpg"]')
      expect(page).not_to have_content 'Edit'
    end
  end

  context 'deleting images' do

    scenario 'removes an image when a user clicks a delete link if they created it' do
      signup
      addimage
      click_link 'Delete'
      expect(page).not_to have_content 'test'
      expect(page).not_to have_css ('img[src*="test.jpg"]')
      expect(page).to have_content 'Image deleted successfully'
    end

    scenario 'does not remove an image if the user did not create it' do
      signup
      addimage
      click_link 'Sign out'
      signuptwo
      expect(page).to have_content 'test'
      expect(page).to have_css ('img[src*="test.jpg"]')
      expect(page).not_to have_content 'Delete'
    end
  end

end