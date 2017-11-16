require 'rails_helper'

describe Tracking do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:accessed_pages) }
end
