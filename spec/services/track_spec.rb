require 'rails_helper'

describe Track do
  describe '#call' do
    subject { Track.new }

    let(:tracking) { FactoryBot.build(:tracking) }
    let(:first_accessed_page) { tracking.accessed_pages.first }

    context 'when not exists a contact with tracking email' do
      it 'create a new contact with tracking email' do
        subject.call(tracking)
        expect(Contact.exists?(email: tracking.email)).to be true
      end
    end

    context 'when exists a contact with tracking email' do
      let!(:contact) { Contact.create(email: tracking.email) }

      it 'not create a new contact with tracking email' do
        subject.call(tracking)
        expect(Contact.where(email: tracking.email).count).to eq 1
      end

      context 'and this contact has accesses' do
        before { contact.update(accesses: [ FactoryBot.build(:access) ] ) }

        it 'adding another accesses' do
          subject.call(tracking)
          expect(contact.accesses.count).to be > 1
        end
      end
    end

    context 'when not exists a page with tracking accessed page url' do
      it 'create a new page with tracking accessed page url' do
        subject.call(tracking)
        expect(Page.exists?(url: first_accessed_page.url)).to be true
      end
    end

    context 'when exists a page with tracking accessed page url' do
      before { Page.create(url: first_accessed_page.url) }

      it 'not create a new page with tracking accessed page url' do
        subject.call(tracking)
        expect(Page.where(url: first_accessed_page.url).count).to eq 1
      end
    end

    it 'create accesses to the contact that has tracking email' do
      subject.call(tracking)

      contact = Contact.find_by(email: tracking.email)
      count_accessed_pages = tracking.accessed_pages.length

      expect(contact.accesses.count).to eq count_accessed_pages
    end
  end
end
