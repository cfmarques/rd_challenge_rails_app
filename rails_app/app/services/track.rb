class Track
  def call(tracking)
    register_accesses(tracking)
  end

  private

  def register_accesses(tracking)
    contact = Contact.find_or_create_by(email: tracking.email)
    contact.accesses << accesses(tracking)
  end

  def accesses(tracking)
    tracking.accessed_pages.map do |accessed_page|
      page = Page.find_or_create_by(url: accessed_page.url)
      Access.new(page: page, datetime: accessed_page.datetime)
    end
  end
end
