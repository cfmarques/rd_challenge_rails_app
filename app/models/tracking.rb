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

  def datetime(datetime)
    return datetime if datetime.is_a?(DateTime)

    begin
      DateTime.strptime(datetime)
    rescue
      datetime_pattern = "%m/%d/%Y, %H:%M:%S"
      DateTime.strptime(datetime, datetime_pattern)
    else
      nil
    end
  end
end
