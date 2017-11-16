class Access < ApplicationRecord
  belongs_to :contact
  belongs_to :page

  validates :datetime, presence: true

  delegate :url, to: :page, prefix: true
end
