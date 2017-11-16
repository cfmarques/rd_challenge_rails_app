class Access < ApplicationRecord
  belongs_to :contact
  belongs_to :page

  validates :datetime, presence: true

  delegate :name, to: :page, prefix: true
  delegate :url, to: :page, prefix: true
end
