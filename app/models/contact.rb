class Contact < ApplicationRecord
  has_many :accesses, dependent: :destroy

  validates :email, presence: true
end
