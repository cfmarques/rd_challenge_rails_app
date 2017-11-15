require 'rails_helper'

describe Access do
  it { is_expected.to belong_to(:contact) }
  it { is_expected.to belong_to(:page) }
  it { is_expected.to validate_presence_of(:datetime) }
end
