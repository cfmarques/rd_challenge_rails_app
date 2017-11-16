class Page < ApplicationRecord
  validates :url, presence: true
  validates :name, presence: true
end
