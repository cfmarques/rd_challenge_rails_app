class Tracking
  include ActiveModel::Model

  attr_accessor :email, :accessed_pages

  validates :email, presence: true
  validates :accessed_pages, presence: true

  def accessed_pages=(accessed_pages)
    return if accessed_pages.blank?

    @accessed_pages = accessed_pages.map do |accessed_page_hash|
      OpenStruct.new(
        url: accessed_page_hash[:url],
        datetime: datetime(accessed_page_hash[:datetime])
      )
    end
  end

  private

  def datetime(string_datetime)
    datetime_pattern = "%m/%d/%Y, %H:%M:%S"
    DateTime.strptime(string_datetime, datetime_pattern)
  end
end
