require 'rails_helper'

feature 'commenting' do
  before {Image.create name: 'test'}

  scenario 'allows users to leave a comment using a form' do
    visit '/images'
    click_link 'Comment on test'
    fill_in "Thoughts", with: "nice logo makers"
    click_button 'Leave Comment'

    expect(current_path).to eq '/images'
    expect(page).to have_content 'nice logo makers'
  end
end