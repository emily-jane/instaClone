require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
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
    scenario 'prompts user to fill out a form, then displays the new image and name' do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Name', with: 'test'
      click_button 'Create Image'
      expect(page).to have_content 'test'
      expect(page).to have_selector 'img'
      expect(current_path).to eq '/images'
    end
  end

end