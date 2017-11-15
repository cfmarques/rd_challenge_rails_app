require 'rails_helper'

describe Track do
  describe '#call' do
    subject { Track.new }

    let(:email) { 'cf.marques@live.com' }
    let(:url) { 'https://www.resultadosdigitais.com.br/' }
    let(:accessed_page) { { url: url, datetime: DateTime.current } }
    let(:accessed_pages) { [accessed_page] }
    let(:tracking) { Tracking.new(email: email, accessed_pages: accessed_pages) }

    context 'when not exists a contact with tracking email' do
      it 'create a new contact with tracking email' do
        subject.call(tracking)
        expect(Contact.exists?(email: email)).to be true
      end
    end

    context 'when exists a contact with tracking email' do
      before { Contact.create(email: email) }

      it 'not create a new contact with tracking email' do
        subject.call(tracking)
        expect(Contact.where(email: email).count).to eq 1
      end
    end

    context 'when not exists a page with tracking accessed page url' do
      it 'create a new page with tracking accessed page url' do
        subject.call(tracking)
        expect(Page.exists?(url: url)).to be true
      end
    end

    context 'when exists a page with tracking accessed page url' do
      before { Page.create(url: url) }

      it 'not create a new page with tracking accessed page url' do
        subject.call(tracking)
        expect(Page.where(url: url).count).to eq 1
      end
    end

    it 'create accesses to the contact that has tracking email' do
      subject.call(tracking)

      contact = Contact.find_by(email: email)
      count_accessed_pages = tracking.accessed_pages.length

      expect(contact.accesses.count).to eq count_accessed_pages
    end
  end
end
