require 'spec_helper'

RSpec.describe Item do
  let(:label) { double('Label') }
  let(:item) { Item.new('04/02/1998') }
  let(:genre) { double('Genre') }
  let(:author) { double('Author') }

  describe '#can_be_archived?' do
    it 'returns true if the pulish date is more than 10 year' do
      expect(item.send(:can_be_archived?)).to be(true)
    end
  end
  def test_move_to_archive
    assert_equal false, item.archived # The item should not be archived initially

    item.move_to_archive

    assert_equal true, item.archived # The item should be archived after calling move_to_archive
  end

  describe '#label=' do
    it 'assigns the label and adds the item to the label' do
      # Stub `items` method to return an empty array
      allow(label).to receive(:items).and_return([])
      # Expect `items` method to be called once
      expect(label).to receive(:items).once.and_return([item])
      item.label = label
      expect(item.label).to eq label
    end

    it 'does not add the item to the label if already present' do
      # Stub `items` method to return an array with the item object
      allow(label).to receive(:items).and_return([item])
      item.label = label
      expect(item.label).to eq label
    end
  end

  describe '#genre=' do
    it 'assigns the genre and adds the item to the genre' do
      # Stub `items` method to return an empty array
      allow(genre).to receive(:items).and_return([])
      # Expect `items` method to be called once
      expect(genre).to receive(:items).once.and_return([item])
      item.genre = genre
      expect(item.genre).to eq genre
    end

    it 'does not add the item to the genre if already present' do
      # Stub `items` method to return an array with the item object
      allow(genre).to receive(:items).and_return([item])
      item.genre = genre
      expect(item.genre).to eq genre
    end
  end
  describe '#author=' do
    it 'assigns the author and adds the item to the author' do
      allow(author).to receive(:items).and_return([])
      expect(author).to receive(:items).once.and_return([item])
      item.author = author
      expect(item.author).to eq author
    end

    it 'does not add the item to the author if already present' do
      allow(author).to receive(:items).and_return([item])
      item.author = author
      expect(item.author).to eq author
    end
  end
end
