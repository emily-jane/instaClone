require 'spec_helper'

describe Image, type: :model do
  it { is_expected.to have_many :comments }

  it 'is not valid when no name is added' do
    image = Image.new(name: '')
    expect(image).to have(1).error_on(:name)
    expect(image).not_to be_valid
  end
end