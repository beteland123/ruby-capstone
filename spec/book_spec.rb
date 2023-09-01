require_relative '../book'

describe Book do
  let(:publisher) { 'publisher1' }
  let(:cover_state) { 'good' }
  let(:publish_date) { '04/3/2023' }
  let(:book) { Book.new(publisher, cover_state, publish_date) }

  describe '#initialize' do
    it 'sets the publisher, cover_state, and publish_date attributes' do
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
      expect(book.publish_date).to eq(Date.parse(publish_date))
    end

    it 'inherits archived: false from its parent' do
      expect(book.archived).to be(false)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true when the book is not archived and cover state is bad' do
      book.cover_state = 'bad'
      expect(book.send(:can_be_archived?)).to be(true)
    end

    it 'returns false when the cover state is not bad' do
      book.cover_state = 'good'
      expect(book.send(:can_be_archived?)).to be(false)
    end
  end
end
