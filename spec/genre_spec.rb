require_relative '../genre'
require_relative '../item' 
require 'date'

class DummyItem < Item
  def genre=(genre)
    @genre = genre
  end
end

describe Genre do
  let(:genre_name) { 'Mystery' }
  let(:genre) { Genre.new(genre_name) }

  describe '#initialize' do
    it 'sets the name attribute' do
      expect(genre.name).to eq(genre_name)
    end

    it 'inherits items as an empty array' do
      expect(genre.items).to be_empty
    end
  end

  describe '#add_item' do
    let(:dummy_item) { DummyItem.new('04/3/2023') }

    it 'adds the item to the collection and sets its genre' do
      genre.add_item(dummy_item)
      
      expect(genre.items).to include(dummy_item)
      expect(dummy_item.genre).to eq(genre)
    end
  end
end
