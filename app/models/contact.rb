class Contact < ApplicationRecord
  has_many :accesses, dependent: :destroy
  has_many :pages, -> { distinct }, through: :accesses

  validates :email, presence: true

  def last_access
    accesses.last
  end

  def last_page_access(page)
    accesses.where(page: page).last
  end

  def prospect?
    prospect_page_names = ['Features', 'Prices', 'Contact']
    page_names = pages.pluck(:name)

    (prospect_page_names - page_names).empty?
  end
end
