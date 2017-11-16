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
      page = Page.find_or_create_by(accessed_page_attributes(accessed_page))
      Access.new(page: page, datetime: accessed_page.datetime)
    end
  end

  private

  def accessed_page_attributes(accessed_page)
    { url: accessed_page.url, name: page_name_from_pathname(accessed_page.pathname) }
  end

  def page_name_from_pathname(pathname)
    return if pathname.blank?

    file_name = pathname.split('/').last

    return 'Home' if file_name.blank?

    name = File.basename(file_name, File.extname(file_name))
    name.parameterize.capitalize.tr('-', ' ').tr('_', ' ')
  end
end
