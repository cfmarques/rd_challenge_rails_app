class Page < ApplicationRecord
  validates :url, presence: true
end
