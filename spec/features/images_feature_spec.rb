require 'rails_helper'

def signup
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end


feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      signup
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do
    before do
      Image.create(name: 'test')
    end

    scenario 'display images and image name' do
      visit '/images'
      expect(page).to have_content 'test'
      expect(page).to have_selector 'img'
      expect(page).not_to have_content 'No images yet'
    end
  end

  context 'adding images' do
    scenario 'prompts user to fill out a form, then displays the new image and name if they are logged in' do
      signup
      visit '/images'
      click_link 'Add an image'
      fill_in 'Name', with: 'test'
      click_button 'Create Image'
      expect(page).to have_content 'test'
      expect(page).to have_selector 'img'
      expect(current_path).to eq '/images'
    end

    scenario 'user should not be allowed to add image if not signed in' do
      visit '/images'
      expect(page).not_to have_link 'Add an image'
    end
  end

  context 'viewing images' do

    let!(:test){Image.create(name:'test')}

    scenario 'lets a user view the whole image' do
      visit '/images'
      click_link 'test'
      expect(page).to have_content 'test'
      expect(page).to have_selector 'img'
      expect(current_path).to eq "/images/#{test.id}"
    end
  end

  context 'editing images' do

    before {Image.create name: 'test'}

    scenario 'let a user edit an image and image name' do
      signup
      visit '/images'
      click_link 'Edit test'
      fill_in 'Name', with: 'testing 123'
      click_button 'Update Image'
      expect(page).to have_content 'testing 123'
      expect(page).to have_selector 'img'
      expect(current_path).to eq '/images'
    end
  end

  context 'deleting images' do

    before {Image.create name: 'test'}

    scenario 'removes an image when a user clicks a delete link' do
      signup
      visit '/images'
      click_link 'Delete test'
      expect(page).not_to have_content 'test'
      expect(page).not_to have_selector 'img'
      expect(page).to have_content 'Image deleted successfully'
    end
  end

end