require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_many :images }

  it { is_expected.to have_many :comments }

  it { is_expected.to have_many :commented_images}
end