require 'rails_helper'

describe Page do
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:name) }
end
