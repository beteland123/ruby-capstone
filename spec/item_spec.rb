
require 'spec_helper'

RSpec.describe Item do
  let(:label) { double('Label') }
  let(:item) { Item.new('04/02/1998') }

  describe '#can_be_archived?' do
    it 'returns true if the pulish date is more than 10 year' do
      expect(item.can_be_archived?).to be(true)
    end
  end
  describe '#move_to_archive' do
  it 'sets archived to true if the item can be archived' do
    allow(item).to receive(:can_be_archived?).and_return(true)
    item.move_to_archive
    expect(item.archived).to be(true)
  end

  it 'does not set archived to true if the item cannot be archived' do
    allow(item).to receive(:can_be_archived?).and_return(false)
    item.move_to_archive
    expect(item.archived).to be(false)
  end
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
end