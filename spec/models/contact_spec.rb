require 'rails_helper'

describe Contact do
  it { is_expected.to have_many(:accesses) }
  it { is_expected.to validate_presence_of(:email) }
end
