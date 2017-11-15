class Access < ApplicationRecord
  belongs_to :contact
  belongs_to :page

  validates :datetime, presence: true
end
